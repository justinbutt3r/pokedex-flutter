import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/pokemon_move.dart';
import '../../data/models/result_errors.dart';
import '../../data/pokemon_repository.dart';

part 'move_list_state.dart';

class MoveListCubit extends Cubit<MoveListState> {
  MoveListCubit({required this.pokemonRepository}) : super(MoveListInitial());
  final PokemonRepository pokemonRepository;

  Future<void> getMovesList({
    String? type,
    String? damageClass,
    required bool effectChance,
  }) async {
    emit(MoveListLoading());
    try {
      List<PokemonMove> movesList = [];
      if (type != null) {
        movesList = await pokemonRepository.getMovesByType(type);
      } else if (damageClass != null) {
        movesList = await pokemonRepository.getMovesByDamageClass(damageClass);
      } else if (effectChance) {
        movesList = await pokemonRepository.getMovesWithEffect();
      } else {
        movesList = await pokemonRepository.getAllMoves();
      }

      emit(MoveListLoaded(moveList: movesList));
    } catch (err) {
      if (err is ErrorGettingPokemon) {
        emit(MoveListError(message: err.error));
      } else {
        emit(MoveListError(message: 'Error $err'));
      }
    }
  }
}
