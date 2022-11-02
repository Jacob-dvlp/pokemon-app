import 'package:app_pokmon/src/model/response_api_pokemon.dart';

abstract class PokemonRepositoryInterface {
  Future<List<Pokemon>> getPokemon();
}
