part of 'pokemon_fetch_cubit.dart';

abstract class PokemonFetchState extends Equatable {
  const PokemonFetchState();

  @override
  List<Object> get props => [];
}

class PokemonFetchInitial extends PokemonFetchState {}

class PokemonFetchLoading extends PokemonFetchState {}

class PokemonFetchLoaded extends PokemonFetchState {
  const PokemonFetchLoaded({required this.pokemon});
  final Pokemon pokemon;

  @override
  List<Object> get props => [pokemon];
}

class PokemonFetchError extends PokemonFetchState {
  const PokemonFetchError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
