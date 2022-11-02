part of 'get_pokemon_cubit.dart';

abstract class GetPokemonState extends Equatable {}

class GetPokemonInitial extends GetPokemonState {
  @override
  List<Object?> get props => [];
}

class GetPokemonLoading extends GetPokemonState {
  final bool isloading = false;
  @override
  List<Object?> get props => [isloading];
}

class GetPokemonSuccess extends GetPokemonState {
  final List<Pokemon>? result;
  final List<ResponseFavorite>? responseFavorite;
  GetPokemonSuccess({this.result, this.responseFavorite});

  @override
  List<Object?> get props => [result, responseFavorite];
}

class GetPokemonError extends GetPokemonState {
  @override
  List<Object?> get props => [];
}
