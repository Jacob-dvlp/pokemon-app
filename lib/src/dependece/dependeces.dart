import 'imports.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerLazySingleton<HttpService>(
    () => HttpImplment(),
  );
  getIt.registerLazySingleton(
    () => GetPokemonCubit(getIt.call(), getIt.call()),
  );
  getIt.registerLazySingleton<PokemonRepositoryInterface>(
    () => PokemonRepositoryImplement(
      httpService: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<PokemonProviderInterface>(
    () => PokemonProviderImplement(
      pokemonRepositoryInterface: getIt.call(),
    ),
  );
  getIt.registerLazySingleton(() => PokemonRepositoryOffline());
}
