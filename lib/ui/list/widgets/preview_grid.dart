import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../core/data/models/pokemon_item.dart';
import 'preview_card.dart';

class PreviewGrid extends StatelessWidget {
  const PreviewGrid({Key? key, required this.pokemonList}) : super(key: key);
  final List<Pokemon> pokemonList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 4 / 5,
        ),
        itemCount: pokemonList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final Pokemon pokemon = pokemonList[index];
          return PreviewCard(pokemon: pokemon);
        },
      ),
    );
  }
}
