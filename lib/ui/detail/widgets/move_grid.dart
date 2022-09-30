import 'package:flutter/material.dart';

import '../../../core/data/models/pokemon_move.dart';
import '../../../core/data/models/pokemon_move_reference.dart';
import '../../shared/widgets/move_item.dart';

//special
//physical
//status

class MoveGrid extends StatelessWidget {
  const MoveGrid({
    Key? key,
    required this.list,
    this.padding = const EdgeInsets.symmetric(
      vertical: 16.0,
    ),
  }) : super(key: key);
  final List<PokemonMoveReference> list;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Moves',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
            ),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final PokemonMoveReference reference = list[index];
              final PokemonMove move = reference.move;

              return MoveItem(
                move: move,
              );
            },
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              mainAxisExtent: 155.0,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
