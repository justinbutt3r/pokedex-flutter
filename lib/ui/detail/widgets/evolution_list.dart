import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/data/models/pokemon_evolution_item.dart';
import '../../../core/data/models/pokemon_summary.dart';
import '../../../core/data/models/pokemon_type.dart';
import '../../../core/models/detail_page_arguments.dart';
import '../../shared/widgets/error_widget.dart';
import 'type_gradient.dart';

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
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(l),
          ),
        ],
      );
    }
  }
}

class EvolutionItem extends StatelessWidget {
  const EvolutionItem({
    Key? key,
    this.image = '',
    required this.id,
    required this.pokemonTypes,
    this.sideMargin = false,
    this.selected = false,
  }) : super(key: key);
  final List<PokemonType> pokemonTypes;
  final String image;
  final int id;
  final bool sideMargin;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    final double sideMar = (sideMargin == true) ? 32.0 : 0;
    return Center(
      child: Container(
        width: 200,
        height: 200,
        margin: EdgeInsets.only(
          right: sideMar,
          bottom: 32.0,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            if (selected)
              const BoxShadow(
                color: Color.fromRGBO(255, 215, 0, 0.25),
                spreadRadius: 5,
                blurRadius: 10,
              ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
          child: InkWell(
            onTap: () {
              Navigator.popAndPushNamed(
                context,
                '/detail',
                arguments: DetailPageArguments(id: id),
              );
            },
            child: Stack(
              children: <Widget>[
                TypeGradient(pokemonTypes: pokemonTypes),
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.75,
                    heightFactor: 0.75,
                    child: (image.isNotEmpty)
                        ? Image.network(
                            image,
                          )
                        : Image.asset(
                            'assets/images/open-pokeball.png',
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
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
        return EvolutionItem(
          pokemonTypes: types,
          id: pokemon.apiId,
          image: pokemon.image,
          sideMargin: list.length - 1 > index,
          selected: pokemon.apiId == currentSelected,
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
          child: Row(
            children: rows,
          ),
        ),
      ),
    );
  }

  return items;
}
