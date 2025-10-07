import 'package:equatable/equatable.dart';
import 'package:example_project/domain/models/episode_model.dart';

sealed class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object?> get props => [];
}

final class HomeScreenInitialState extends HomeScreenState {
  const HomeScreenInitialState();
}

final class HomeScreenLoadingState extends HomeScreenState {
  const HomeScreenLoadingState();
}

final class HomeScreenLoadedState extends HomeScreenState {
  final List<EpisodeModel> episodes;

  const HomeScreenLoadedState({
    required this.episodes,
  });

  @override
  List<Object?> get props => [episodes];
}

final class HomeScreenLoadedEmptyState extends HomeScreenState {
  const HomeScreenLoadedEmptyState();
}

final class HomeScreenErrorState extends HomeScreenState {
  const HomeScreenErrorState();
}
