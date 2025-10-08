import 'package:dio/dio.dart';
import 'package:example_project/application/home_screen/home_screen_cubit.dart';
import 'package:example_project/domain/repositories/i_episodes_repository.dart';
import 'package:example_project/infrastructure/repositories/episodes_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

GetIt getIt = GetIt.instance;

/// Registers all dependencies with the service locator
void registerDependencies() {
  getIt.registerFactory(
    () => HomeScreenCubit(
      episodesRepository: getIt<IEpisodesRepository>(),
    ),
  );
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerLazySingleton<Logger>(() => Logger());
  getIt.registerSingleton<IEpisodesRepository>(
    EpisodesRepository(
      dio: getIt<Dio>(),
      logger: getIt<Logger>(),
    ),
  );
}
