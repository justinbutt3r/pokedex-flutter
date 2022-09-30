import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/data/models/pokemon_evolution_item.dart';
import '../../../core/data/models/pokemon_summary.dart';
import '../../../core/data/models/pokemon_type.dart';
import '../../shared/widgets/error_widget.dart';
import 'evolution_item.dart';

class EvolutionList extends StatelessWidget {
  const EvolutionList(
      {Key? key, this.evolutionList, required this.currentSelected})
      : super(key: key);

  final PokemonEvolutionItem? evolutionList;
  final int currentSelected;
  @override
  Widget build(BuildContext context) {
    if (evolutionList == null) {
      return const PokemonErrorWidget(
        message: 'No Evolution info found',
        showBackButton: false,
      );
    } else {
      final List<Widget> l = getEvolutionList(evolutionList!, currentSelected);
      return CustomScrollView(
        semanticChildCount: l.length,
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final int itemIndex = index ~/ 2;
                if (index.isEven) {
                  return l[itemIndex];
                }
                return Container(
                  margin: const EdgeInsets.only(bottom: 32.0),
                  child: const Icon(Icons.arrow_downward),
                );
              },
              semanticIndexCallback: (Widget widget, int localIndex) {
                if (localIndex.isEven) {
                  return localIndex ~/ 2;
                }
                return null;
              },
              childCount: math.max(0, l.length * 2 - 1),
            ),
          ),
        ],
      );
    }
  }
}

List<Widget> getEvolutionList(PokemonEvolutionItem list, int currentSelected) {
  List<Widget> items = [];
  try {
    final PokemonSummary? pokemon = list.pokemon;

    if (pokemon != null) {
      final List<PokemonType> types = pokemon.types
          .map((e) => PokemonType(id: e.id, name: e.name))
          .toList();
      items.add(
        EvolutionItem(
          pokemonTypes: types,
          id: pokemon.apiId,
          image: pokemon.image,
          selected: pokemon.apiId == currentSelected,
        ),
      );
    } else {
      items.add(const PokemonErrorWidget());
    }
    if (list.evolvesInto.isNotEmpty)
      items = items + getEvolutionListInner(list.evolvesInto, currentSelected);
  } catch (e) {
    inspect(e);
  }
  return items;
}

List<Widget> getEvolutionListInner(
    List<PokemonEvolutionItem> list, int currentSelected) {
  List<Widget> items = [];
  if (list.length == 1) {
    final PokemonSummary? pokemon = list[0].pokemon;
    if (pokemon != null) {
      final List<PokemonType> types = pokemon.types
          .map((e) => PokemonType(id: e.id, name: e.name))
          .toList();
      items.add(
        EvolutionItem(
          pokemonTypes: types,
          id: pokemon.apiId,
          image: pokemon.image,
          selected: pokemon.apiId == currentSelected,
        ),
      );
    } else {
      items.add(const PokemonErrorWidget());
    }

    if (list[0].evolvesInto.isNotEmpty)
      items =
          items + getEvolutionListInner(list[0].evolvesInto, currentSelected);
  } else {
    final List<Widget> rows = list.map((e) {
      final int index = list.indexOf(e);
      final PokemonSummary? pokemon = e.pokemon;
      if (pokemon != null) {
        final List<PokemonType> types = pokemon.types
            .map((e) => PokemonType(id: e.id, name: e.name))
            .toList();
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EvolutionItem(
                pokemonTypes: types,
                id: pokemon.apiId,
                image: pokemon.image,
                sideMargin: list.length - 1 > index,
                selected: pokemon.apiId == currentSelected,
              ),
              if (e.evolvesInto.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(bottom: 32.0),
                  child: const Icon(Icons.arrow_downward),
                ),
              ...getEvolutionListInner(e.evolvesInto, currentSelected)
            ],
          ),
        );
      } else {
        return const PokemonErrorWidget();
      }
    }).toList();

    items.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: rows,
            ),
          ),
        ),
      ),
    );
  }

  return items;
}
