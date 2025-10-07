import 'package:bloc/bloc.dart';
import 'package:example_project/application/home_screen/home_screen_state.dart';
import 'package:example_project/domain/repositories/i_episodes_repository.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final IEpisodesRepository episodesRepository;

  HomeScreenCubit({
    required this.episodesRepository,
  }) : super(
          HomeScreenInitialState(),
        );

  Future<void> getEpisodes() async {
    emit(HomeScreenLoadingState());

    final response = await episodesRepository.getAllEpisodes();

    response.fold(
      (l) => emit(HomeScreenErrorState()),
      (r) => emit(HomeScreenLoadedState(episodes: r.episodes)),
    );
  }
}
