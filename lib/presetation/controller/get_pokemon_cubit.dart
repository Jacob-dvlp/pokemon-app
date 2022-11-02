import 'package:app_pokmon/src/model/response_api_pokemon.dart';

import 'imports.dart';

part 'get_pokemon_state.dart';

class GetPokemonCubit extends Cubit<GetPokemonState> {
  final PokemonProviderInterface pokemonProviderInterface;
  final PokemonRepositoryOffline pokemonRepositoryOffline;

  GetPokemonCubit(this.pokemonProviderInterface, this.pokemonRepositoryOffline)
      : super(GetPokemonInitial()) {
    getPokemon();
  }

  Future getPokemon() async {
    try {
      emit(GetPokemonLoading());
      final getResponseApi = await pokemonProviderInterface.getPokemon();
      final responseFavorited =
          await pokemonRepositoryOffline.getPokemonFavorites();
      final favoriteGetStorage = await getFavoritePokemon(
          responseApi: getResponseApi, responseFavorite: responseFavorited);
      emit(GetPokemonSuccess(
          result: favoriteGetStorage, responseFavorite: responseFavorited));
    } catch (e) {
      emit(GetPokemonError());
    }
  }

  Future<List<Pokemon>> getFavoritePokemon(
      {List<Pokemon>? responseApi,
      List<ResponseFavorite>? responseFavorite}) async {
    List<ResponseFavorite> favoriteList = [];
    if (responseFavorite!.isEmpty) {
      return responseApi!;
    } else {
      for (Pokemon result in responseApi!) {
        for (ResponseFavorite favoritList in responseFavorite) {
          if (result.name == favoritList.name && favoritList.favorite!) {
            if (!favoriteList
                .map((ResponseFavorite item) => item.name)
                .contains(favoritList.name)) {
              favoriteList.add(ResponseFavorite(
                  favorite: true, name: result.name, num: result.num));
            }
          }
        }
        if (!favoriteList
            .map((ResponseFavorite item) => item.name)
            .contains(result.name)) {
          favoriteList.add(
            ResponseFavorite(
                favorite: result.favorite, name: result.name, num: result.num),
          );
        }
      }
      final data = favoriteList
          .map((ResponseFavorite e) =>
              Pokemon(name: e.name, num: e.num, favorite: e.favorite!))
          .toList();
      return data;
    }
  }
}
