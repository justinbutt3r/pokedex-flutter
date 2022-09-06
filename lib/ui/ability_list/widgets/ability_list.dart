import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';

import '../../../core/data/models/pokemon_ability.dart';
import 'ability_card.dart';

class AbilityList extends StatelessWidget {
  const AbilityList({Key? key, required this.abilityList}) : super(key: key);

  final List<PokemonAbility> abilityList;

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return FadingEdgeScrollView.fromScrollView(
      child: ListView.builder(
        controller: controller,
        padding: EdgeInsets.zero,
        itemCount: abilityList.length,
        itemBuilder: (context, index) {
          final PokemonAbility ability = abilityList[index];
          return AbilityCard(ability: ability);
        },
      ),
    );
  }
}
