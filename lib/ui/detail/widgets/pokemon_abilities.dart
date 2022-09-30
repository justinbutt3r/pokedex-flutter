import 'package:flutter/material.dart';

import '../../../core/data/models/pokemon_ability.dart';
import 'ability_item.dart';

class PokemonAbilities extends StatelessWidget {
  const PokemonAbilities({
    Key? key,
    required this.pokemonAbilities,
    this.padding = const EdgeInsets.all(16.0),
  }) : super(key: key);
  final List<PokemonAbility> pokemonAbilities;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Abilities',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
