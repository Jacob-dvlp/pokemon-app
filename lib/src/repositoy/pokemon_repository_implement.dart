


import 'imports.dart';

class PokemonRepositoryImplement implements PokemonRepositoryInterface {
  final HttpService httpService;
  List<Pokemon> responseApi = [];

  PokemonRepositoryImplement({required this.httpService});
  @override
  Future<List<Pokemon>> getPokemon() async {
    try {
      Response response = await httpService.get(endPoint);
      final convertModel = response.body;
      final model = responseApiFromJson(convertModel);
      responseApi = model.pokemon!;
      return responseApi;
    } catch (e) {
      return [];
    }
  }
}
