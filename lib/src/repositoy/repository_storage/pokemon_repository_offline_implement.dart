import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../model/response_favorite.dart';

class PokemonRepositoryOffline {
  final getStorage = GetStorage();
  List<dynamic> favoriteList = [];

  Future createFavorite({ResponseFavorite? createFavorite}) async {
    final favoriteListget = await getPokemonFavorites();
    final isFavorited =
        favoriteListget.map((item) => item.name).contains(createFavorite!.name);
    if (isFavorited) {
      deleteFavorite(createFavorite);
    } else {
      saveFavorite(createFavorite);
    }
  }

  Future<List<ResponseFavorite>> getPokemonFavorites() async {
    try {
      final response = getStorage.read('listFavorite');
      favoriteList = json.decode(response);
      final data = favoriteList
          .map((e) => ResponseFavorite.fromJson(json.decode(e)))
          .toList();
      return data;
    } catch (e) {
      return [];
    }
  }

  deleteFavorite(ResponseFavorite createFavorite) {
    favoriteList.remove(createFavorite);
    getStorage.write('listFavorite', json.encode(favoriteList));
  }

  saveFavorite(ResponseFavorite createFavorite) {
    favoriteList.add(createFavorite);
    getStorage.write('listFavorite', json.encode(favoriteList));
  }
}
