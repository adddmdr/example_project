import 'package:dartz/dartz.dart';
import 'package:example_project/domain/models/episodes_model.dart';
import 'package:example_project/domain/models/failure.dart';

abstract class IEpisodesRepository {
  Future<Either<Failure, EpisodesModel>> getAllEpisodes();
}
