import 'package:app_pokmon/src/model/response_api_pokemon.dart';

abstract class PokemonProviderInterface {
  Future<List<Pokemon>> getPokemon();
}
