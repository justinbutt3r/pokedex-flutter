import 'package:flutter/material.dart';
import '../../../core/data/models/pokemon_evolution_item.dart';
import '../../../core/data/models/pokemon_summary.dart';
import '../../../utils/generate_evolution_list.dart';
import '../../shared/widgets/error_widget.dart';

class EvolutionRow extends StatelessWidget {
  const EvolutionRow({
    Key? key,
    this.evolutionList,
    required this.currentSelected,
    this.padding = const EdgeInsets.symmetric(
      vertical: 16.0,
    ),
  }) : super(key: key);

  final PokemonEvolutionItem? evolutionList;
  final int currentSelected;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    if (evolutionList == null) {
      return const PokemonErrorWidget(
        message: 'No Evolution info found',
        showBackButton: false,
      );
    }

    final List<List<PokemonSummary>> treeValues =
        generateEvolutionList(evolutionList!, currentSelected);

    final List<Widget> list = treeValues.map((List<PokemonSummary> value) {
      if (value.length > 1) {
        return getEvoIntoList(value);
      } else {
        final PokemonSummary pokemon = value[0];
        return getEvoItem(pokemon, currentSelected);
      }
    }).toList();

    const double baseSize = 185;
    double size = baseSize;
    for (final item in treeValues) {
      final double temp = item.length * baseSize;
      if (temp > size) {
        size = temp;
      }
    }

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Evolution',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: size,
            child: ListView.separated(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final Widget item = list[index];
                return item;
              },
              itemCount: list.length,
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(
                    bottom: 32.0,
                    left: 32,
                    right: 32,
                  ),
                  child: const Icon(Icons.arrow_right_alt),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
