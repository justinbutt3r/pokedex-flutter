import 'package:flutter/material.dart';

import '../core/data/models/pokemon_evolution_item.dart';
import '../core/data/models/pokemon_summary.dart';
import '../core/data/models/pokemon_type.dart';
import '../ui/detail/widgets/evolution_item.dart';

List<List<PokemonSummary>> generateEvolutionList(
    PokemonEvolutionItem evolutionItem, int currentSelected) {
  final Map<String, List<PokemonSummary>> tree = {
    'row_0': [],
    'row_1': [],
    'row_2': [],
    'row_3': [],
    'row_4': [],
  };

  void addToTree(PokemonEvolutionItem evolutionItem, int level) {
    final PokemonSummary? innerPokemon = evolutionItem.pokemon;
    if (innerPokemon != null) {
      tree['row_${level.toString()}']?.add(innerPokemon);
    }

    if (evolutionItem.evolvesInto.isNotEmpty) {
      for (final element in evolutionItem.evolvesInto) {
        addToTree(element, level + 1);
      }
    }
  }

  final PokemonSummary? pokemon = evolutionItem.pokemon;
  if (pokemon != null) {
    tree['row_0']?.add(pokemon);
  }

  if (evolutionItem.evolvesInto.isNotEmpty) {
    final List<PokemonEvolutionItem> evolvesInto = evolutionItem.evolvesInto;
    for (final element in evolvesInto) {
      addToTree(element, 1);
    }
  }

  final treeValues = tree.values.toList();
  treeValues.removeWhere((item) => item.isEmpty);

  return treeValues;
}

Widget getEvoIntoList(List<PokemonSummary> list) {
  return Column(
    children: list.map((e) => getEvoItem(e, 1)).toList(),
  );
}

Widget getEvoItem(PokemonSummary pokemon, int currentSelected) {
  final List<PokemonType> types =
      pokemon.types.map((e) => PokemonType(id: e.id, name: e.name)).toList();

  return EvolutionItem(
    pokemonTypes: types,
    id: pokemon.apiId,
    image: pokemon.image,
    selected: pokemon.apiId == currentSelected,
    mini: true,
  );
}
