import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';

import '../../../core/data/models/pokemon_ability.dart';
import '../../../utils/theme.dart';

class AbilityCard extends StatelessWidget {
  const AbilityCard({Key? key, required this.ability}) : super(key: key);
  final PokemonAbility ability;
  ScrollController get controllerChild => ScrollController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 250,
        child: Column(
          children: [
            Text(
              ability.name,
              style: largeTextStyle,
            ),
            if (ability.flavour.isNotEmpty)
              Text(
                ability.flavour,
                style: smallTextStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            const SizedBox(
              height: sizeBetween,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: FadingEdgeScrollView.fromSingleChildScrollView(
                  gradientFractionOnEnd: 0.5,
                  child: SingleChildScrollView(
                    controller: controllerChild,
                    child: Text(
                      ability.description,
                      style: bodyTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
