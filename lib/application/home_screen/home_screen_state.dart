import 'package:equatable/equatable.dart';
import 'package:example_project/domain/models/episode_model.dart';

/// Base state for the home screen flow.
sealed class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object?> get props => [];
}

/// State emitted while the episode list is being fetched.
class HomeScreenLoadingState extends HomeScreenState {
  const HomeScreenLoadingState();
}

/// State carrying the successfully fetched list of episodes.
class HomeScreenLoadedState extends HomeScreenState {
  const HomeScreenLoadedState({
    required this.episodes,
  });

  final List<EpisodeModel> episodes;

  @override
  List<Object?> get props => [episodes];
}

/// State emitted when the API call succeeds but returns no episodes.
class HomeScreenLoadedEmptyState extends HomeScreenState {
  const HomeScreenLoadedEmptyState();
}

/// State emitted when fetching episodes fails.
class HomeScreenErrorState extends HomeScreenState {
  const HomeScreenErrorState();
}
