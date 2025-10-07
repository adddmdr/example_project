import 'package:dio/dio.dart';
import 'package:example_project/application/home_screen/home_screen_cubit.dart';
import 'package:example_project/domain/repositories/i_episodes_repository.dart';
import 'package:example_project/infrastructure/repositories/episodes_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void registerDependencies() {
  getIt.registerFactory(
    () => HomeScreenCubit(
      episodesRepository: getIt<IEpisodesRepository>(),
    ),
  );
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<IEpisodesRepository>(
    EpisodesRepository(
      dio: getIt<Dio>(),
    ),
  );
}
