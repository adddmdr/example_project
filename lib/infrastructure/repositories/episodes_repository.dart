import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:example_project/domain/models/episode_model.dart';
import 'package:example_project/domain/models/episodes_model.dart';
import 'package:example_project/domain/models/failure.dart';
import 'package:example_project/domain/repositories/i_episodes_repository.dart';

class EpisodesRepository implements IEpisodesRepository {
  final Dio dio;

  EpisodesRepository({
    required this.dio,
  });

  final api = 'https://rickandmortyapi.com/api';

  @override
  Future<Either<Failure, EpisodesModel>> getAllEpisodes() async {
    try {
      final response =
          await dio.get<Map<String, dynamic>>('$api/episode');
      final data = response.data;

      if (data == null) {
        return const Left(Failure(message: 'Empty response'));
      }

      return Right(EpisodesModel.fromJson(data));
    } on DioException catch (e) {
      return Left(Failure(message: e.message ?? 'error'));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, EpisodeModel>> getEpisode({required int id}) async {
    try {
      final response =
          await dio.get<Map<String, dynamic>>('$api/episode/$id');
      final data = response.data;

      if (data == null) {
        return const Left(Failure(message: 'Empty response'));
      }

      return Right(EpisodeModel.fromJson(data));
    } on DioException catch (e) {
      return Left(Failure(message: e.message ?? 'error'));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
