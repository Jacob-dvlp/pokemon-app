import 'package:app_pokmon/src/model/response_api_pokemon.dart';

import '../repositoy/pokemon_repository_interface.dart';
import 'pokemon_provider_interface.dart';

class PokemonProviderImplement implements PokemonProviderInterface {
  final PokemonRepositoryInterface pokemonRepositoryInterface;

  PokemonProviderImplement({required this.pokemonRepositoryInterface});
  @override
  Future<List<Pokemon>> getPokemon() async {
    final response = await pokemonRepositoryInterface.getPokemon();
    return response;
  }
}
