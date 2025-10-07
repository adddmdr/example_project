import 'package:example_project/domain/models/episode_model.dart';

sealed class HomeScreenState {}

final class HomeScreenInitialState extends HomeScreenState {}

final class HomeScreenLoadingState extends HomeScreenState {}

final class HomeScreenLoadedState extends HomeScreenState {
  final List<EpisodeModel> episodes;

  HomeScreenLoadedState({
    required this.episodes,
  });
}

final class HomeScreenLoadedEmptyState extends HomeScreenState {}

final class HomeScreenErrorState extends HomeScreenState {}
