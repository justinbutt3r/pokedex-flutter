import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/pokemon_ability.dart';
import '../../data/models/result_errors.dart';
import '../../data/pokemon_repository.dart';

part 'ability_list_state.dart';

class AbilityListCubit extends Cubit<AbilityListState> {
  AbilityListCubit({required this.pokemonRepository})
      : super(AbilityListInitial());
  final PokemonRepository pokemonRepository;

  Future<void> getAbilityList() async {
    emit(AbilityListLoading());

    try {
      final List<PokemonAbility> abilityList =
          await pokemonRepository.getAllAbilities();
      inspect(abilityList);
      emit(AbilityListLoaded(abilityList: abilityList));
    } catch (err) {
      inspect(err);
      if (err is ErrorGettingPokemon) {
        emit(AbilityListError(message: err.error));
      } else {
        emit(AbilityListError(message: 'Error $err'));
      }
    }
  }
}
