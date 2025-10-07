import 'package:example_project/application/home_screen/home_screen_state.dart';
import 'package:example_project/domain/repositories/i_episodes_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final IEpisodesRepository episodesRepository;

  HomeScreenCubit({
    required this.episodesRepository,
  }) : super(
          const HomeScreenInitialState(),
        );

  Future<void> getEpisodes() async {
    emit(const HomeScreenLoadingState());

    final response = await episodesRepository.getAllEpisodes();

    response.fold(
      (l) => emit(const HomeScreenErrorState()),
      (r) => emit(r.episodes.isNotEmpty
          ? HomeScreenLoadedState(episodes: r.episodes)
          : const HomeScreenLoadedEmptyState()),
    );
  }
}
