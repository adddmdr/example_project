import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:example_project/core/constants/app_api.dart';
import 'package:example_project/core/network/dio_exception_mapper.dart';
import 'package:example_project/domain/models/episodes_model.dart';
import 'package:example_project/domain/models/failure.dart';
import 'package:example_project/domain/repositories/i_episodes_repository.dart';
import 'package:logger/logger.dart';

/// Data source responsible for retrieving episode data from the public API
class EpisodesRepository
    with DioExceptionMapper
    implements IEpisodesRepository {
  final Dio dio;
  final Logger logger;

  EpisodesRepository({
    required this.dio,
    required this.logger,
  });

  /// Fetches episodes from the API
  @override
  Future<Either<Failure, EpisodesModel>> getAllEpisodes() async {
    try {
      final response = await dio.get<Map<String, dynamic>>(AppApi.episodes);
      final data = response.data;

      if (data == null) {
        logger.w('Empty response received from ${AppApi.episodes}');
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

  /// Builds a failure representing an unhandled exception.
  Failure _unexpectedFailure(Object error) => Failure(
        message: error.toString(),
        type: FailureType.unexpected,
      );

  /// Builds a failure describing an empty response from the API.
  Failure _emptyResponseFailure() => const Failure(
        message: 'Empty response',
        type: FailureType.emptyResponse,
      );
}
