import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../core/data/models/pokemon_summary.dart';
import 'preview_card.dart';

class PreviewGrid extends StatelessWidget {
  const PreviewGrid({Key? key, required this.pokemonList}) : super(key: key);
  final List<PokemonSummary> pokemonList;

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Container(
      padding: EdgeInsets.zero,
      child: FadingEdgeScrollView.fromScrollView(
        child: GridView.builder(
          controller: controller,
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 4 / 5.5,
          ),
          itemCount: pokemonList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final PokemonSummary pokemon = pokemonList[index];
            return PreviewCard(pokemon: pokemon);
          },
        ),
      ),
    );
  }
}
