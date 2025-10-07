import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:example_project/core/network/dio_exception_mapper.dart';
import 'package:example_project/domain/models/episode_model.dart';
import 'package:example_project/domain/models/episodes_model.dart';
import 'package:example_project/domain/models/failure.dart';
import 'package:example_project/domain/repositories/i_episodes_repository.dart';
import 'package:logger/logger.dart';

class EpisodesRepository
    with DioExceptionMapper
    implements IEpisodesRepository {
  final Dio dio;
  final Logger logger;

  EpisodesRepository({
    required this.dio,
    required this.logger,
  });

  final api = 'https://rickandmortyapi.com/api';

  @override
  Future<Either<Failure, EpisodesModel>> getAllEpisodes() async {
    try {
      final response = await dio.get<Map<String, dynamic>>('$api/episode');
      final data = response.data;

      if (data == null) {
        logger.w('Empty response received from $api/episode');
        return Left(_emptyResponseFailure());
      }

      logger.i('Fetched ${data['results']?.length ?? 0} episodes');
      return Right(EpisodesModel.fromJson(data));
    } on DioException catch (e) {
      logger.e('DioException when fetching episodes', error: e);
      return Left(mapDioException(e));
    } catch (e, stackTrace) {
      logger.e('Unexpected error when fetching episodes',
          error: e, stackTrace: stackTrace);
      return Left(_unexpectedFailure(e));
    }
  }

  @override
  Future<Either<Failure, EpisodeModel>> getEpisode({required int id}) async {
    try {
      final response = await dio.get<Map<String, dynamic>>('$api/episode/$id');
      final data = response.data;

      if (data == null) {
        logger.w('Empty response received from $api/episode/$id');
        return Left(_emptyResponseFailure());
      }

      logger.i('Fetched episode with id $id');
      return Right(EpisodeModel.fromJson(data));
    } on DioException catch (e) {
      logger.e('DioException when fetching episode $id', error: e);
      return Left(mapDioException(e));
    } catch (e, stackTrace) {
      logger.e('Unexpected error when fetching episode $id',
          error: e, stackTrace: stackTrace);
      return Left(_unexpectedFailure(e));
    }
  }

  Failure _unexpectedFailure(Object error) => Failure(
        message: error.toString(),
        type: FailureType.unexpected,
      );

  Failure _emptyResponseFailure() => const Failure(
        message: 'Empty response',
        type: FailureType.emptyResponse,
      );
}
