import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/pokemon_item.dart';
import '../../data/models/result_errors.dart';
import '../../data/pokemon_repository.dart';

part 'pokemon_fetch_state.dart';

class PokemonFetchCubit extends Cubit<PokemonFetchState> {
  PokemonFetchCubit({required this.pokemonRepository})
      : super(PokemonFetchInitial());
  final PokemonRepository pokemonRepository;

  Future<void> getPokemon(int id) async {
    emit(PokemonFetchLoading());

    try {
      final Pokemon pokemon = await pokemonRepository.getPokemon(id);
      emit(PokemonFetchLoaded(pokemon: pokemon));
    } catch (err) {
      if (err is ErrorGettingPokemon) {
        emit(PokemonFetchError(message: err.error));
      } else {
        emit(PokemonFetchError(message: 'Error $err'));
      }
    }
  }
}
