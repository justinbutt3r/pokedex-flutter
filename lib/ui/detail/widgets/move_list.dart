import 'package:flutter/material.dart';

import '../../../core/data/models/pokemon_move.dart';
import '../../../core/data/models/pokemon_move_reference.dart';
import '../../../utils/types.dart';
import 'move_item.dart';

//special
//physical
//status

class MoveList extends StatelessWidget {
  const MoveList({Key? key, required this.list}) : super(key: key);
  final List<PokemonMoveReference> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final PokemonMoveReference reference = list[index];
        final PokemonMove move = reference.move;
        final Color color = getTypeColor(move.type.name);

        return MoveItem(
          move: move,
        );
      },
    );
  }
}
