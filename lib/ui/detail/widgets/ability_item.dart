import 'package:flutter/material.dart';
import '../../../core/data/models/pokemon_ability.dart';
import '../../../utils/theme.dart';

class AbilityItem extends StatelessWidget {
  const AbilityItem({Key? key, required this.ability}) : super(key: key);
  final PokemonAbility ability;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(bottom: sizeBetween),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    ability.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  ability.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
