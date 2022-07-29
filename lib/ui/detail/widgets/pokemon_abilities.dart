import 'package:flutter/material.dart';

import '../../../core/data/models/pokemon_ability.dart';
import '../../../utils/theme.dart';
import 'ability_item.dart';

class PokemonAbilities extends StatelessWidget {
  const PokemonAbilities({Key? key, required this.pokemonAbilities})
      : super(key: key);
  final List<PokemonAbility> pokemonAbilities;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Abilities',
            style: bodyTextStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.only(top: 10.0),
            shrinkWrap: true,
            itemCount: pokemonAbilities.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final PokemonAbility ability = pokemonAbilities[index];
              return AbilityItem(
                ability: ability,
              );
            },
          )
        ],
      ),
    );
  }
}
