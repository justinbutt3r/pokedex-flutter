// Referenced
// https://github.com/Naramsim/Colosseum/blob/master/src/scripts/helpers/getMultipliers.js

// ignore_for_file: avoid_dynamic_calls, avoid_function_literals_in_foreach_calls, noop_primitive_operations

import '../core/data/models/pokemon_type.dart';
import '../core/data/models/pokemon_type_reference.dart';
import '../core/models/type_effectiveness.dart';

Map<String, List<TypeEffectiveness>> defenseEffectiveCalculator(
    List<PokemonType> pokemonTypes) {
  final Map multipliers = {};

  List<PokemonTypeReference> halffrom = [];
  pokemonTypes.forEach(
      (PokemonType pt) => {halffrom = halffrom + (pt.halfDamageFrom ?? [])});
  List<PokemonTypeReference> noFrom = [];
  pokemonTypes
      .forEach((PokemonType pt) => {noFrom = noFrom + (pt.noDamageFrom ?? [])});
  List<PokemonTypeReference> doubleFrom = [];
  pokemonTypes.forEach((PokemonType pt) =>
      {doubleFrom = doubleFrom + (pt.doubleDamageFrom ?? [])});

  // List<PokemonTypeReference> halfto = [];
  // pokemonTypes.forEach((pt) => {halfto = halfto + (pt.halfDamageTo ?? [])});
  // List<PokemonTypeReference> noto = [];
  // pokemonTypes.forEach((pt) => {noto = noto + (pt.noDamageTo ?? [])});
  // List<PokemonTypeReference> doubleto = [];
  // pokemonTypes
  //     .forEach((pt) => {doubleto = doubleto + (pt.doubleDamageTo ?? [])});

  // noto.forEach((type) => {
  //       if (multipliers['attack'].containsKey(type.name))
  //         {
  //           multipliers['attack'][type.name] =
  //               multipliers['attack'][type.name] * 0
  //         }
  //       else
  //         {multipliers['attack'][type.name] = 0}
  //     });
  noFrom.forEach((PokemonTypeReference type) => {
        if (multipliers.containsKey(type.name))
          {multipliers[type.name] = multipliers[type.name] * 0}
        else
          {multipliers[type.name] = 0}
      });
  // halfto.forEach((type) => {
  //       if (multipliers['attack'].containsKey(type.name))
  //         {
  //           multipliers['attack'][type.name] =
  //               multipliers['attack'][type.name] * 0.5
  //         }
  //       else
  //         {multipliers['attack'][type.name] = 0.5}
  //     });
  halffrom.forEach((PokemonTypeReference type) => {
        if (multipliers.containsKey(type.name))
          {multipliers[type.name] = multipliers[type.name] * 0.5}
        else
          {multipliers[type.name] = 0.5}
      });
  // doubleto.forEach((type) => {
  //       if (multipliers['attack'].containsKey(type.name))
  //         {
  //           multipliers['attack'][type.name] =
  //               multipliers['attack'][type.name] * 2
  //         }
  //       else
  //         {multipliers['attack'][type.name] = 2}
  //     });
  doubleFrom.forEach((PokemonTypeReference type) => {
        if (multipliers.containsKey(type.name))
          {multipliers[type.name] = multipliers[type.name] * 2}
        else
          {multipliers[type.name] = 2}
      });

  final Map<String, List<TypeEffectiveness>> defense = {
    'weak': [],
    'strong': [],
    'immune': []
  };
  multipliers.forEach((k, v) {
    final String key = k.toString();
    final double value = double.tryParse(v.toString()) ?? 0;

    if (value == 0) {
      defense['immune']?.add(TypeEffectiveness(key, value));
    } else if (value > 1) {
      defense['weak']?.add(TypeEffectiveness(key, value));
    } else if (value != 1) {
      defense['strong']?.add(TypeEffectiveness(key, value));
    }
  });

  return defense;
}
