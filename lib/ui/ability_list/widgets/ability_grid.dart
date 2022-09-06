import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';

import '../../../core/data/models/pokemon_ability.dart';
import 'ability_card.dart';

class AbilityGrid extends StatelessWidget {
  const AbilityGrid({
    Key? key,
    required this.abilityList,
    this.crossAxisCount = 3,
  }) : super(key: key);

  final List<PokemonAbility> abilityList;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return FadingEdgeScrollView.fromScrollView(
      child: GridView.builder(
        controller: controller,
        padding: EdgeInsets.zero,
        itemCount: abilityList.length,
        itemBuilder: (context, index) {
          final PokemonAbility ability = abilityList[index];
          return AbilityCard(ability: ability);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        shrinkWrap: true,
      ),
    );
  }
}
