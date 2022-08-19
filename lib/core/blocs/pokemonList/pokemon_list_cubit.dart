import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/pokemon_summary.dart';
import '../../data/models/result_errors.dart';
import '../../data/pokemon_repository.dart';

part 'pokemon_list_state.dart';

class PokemonListCubit extends Cubit<PokemonListState> {
  PokemonListCubit({required this.pokemonRepository})
      : super(PokemonListInitial());
  final PokemonRepository pokemonRepository;

  Future<void> getPokemonList({
    int? generation,
    String? type,
    bool? isMythical,
    bool? isLegendary,
  }) async {
    emit(PokemonListLoading());
    try {
      List<PokemonSummary> pokemonList = [];
      if (generation != null) {
        pokemonList = await pokemonRepository.getAllPokemon(generation);
      }
      if (type != null) {
        pokemonList = await pokemonRepository.getAllPokemonByType(type);
      }
      if (isMythical != null) {
        pokemonList =
            await pokemonRepository.getAllPokemonByFlag(isMythical: isMythical);
      }
      if (isLegendary != null) {
        pokemonList = await pokemonRepository.getAllPokemonByFlag(
            isLegendary: isLegendary);
      }
      emit(PokemonListLoaded(pokemonList: pokemonList));
    } catch (err) {
      if (err is ErrorGettingPokemon) {
        emit(PokemonListError(message: err.error));
      } else {
        emit(PokemonListError(message: 'Error $err'));
      }
    }
  }
}
