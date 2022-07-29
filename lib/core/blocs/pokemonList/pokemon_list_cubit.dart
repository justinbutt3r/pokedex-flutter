import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/pokemon_item.dart';
import '../../data/models/result_errors.dart';
import '../../data/pokemon_repository.dart';

part 'pokemon_list_state.dart';

class PokemonListCubit extends Cubit<PokemonListState> {
  PokemonListCubit({required this.pokemonRepository})
      : super(PokemonListInitial());
  final PokemonRepository pokemonRepository;

  Future<void> getPokemonList(int generation) async {
    emit(PokemonListLoading());

    try {
      final List<Pokemon> pokemonList =
          await pokemonRepository.getAllPokemon(generation);
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
