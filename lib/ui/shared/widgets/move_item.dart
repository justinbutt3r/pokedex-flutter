import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../../core/data/models/pokemon_move.dart';
import '../../../utils/helpers.dart';
import '../../../utils/theme.dart';
import '../../../utils/types.dart';
import 'card_flip.dart';

class MoveItem extends StatelessWidget {
  const MoveItem({
    Key? key,
    required this.move,
  }) : super(key: key);

  final PokemonMove move;
  @override
  Widget build(BuildContext context) {
    final Color color = getTypeColor(move.type.name);
    return CardFlip(
      front: GenericInfo(
        color: color,
        name: move.name,
        description: move.description,
        type: move.type.name,
      ),
      back: ExtraInfo(
        color: color,
        pp: move.pp,
        power: move.power,
        target: move.target,
        accuracy: move.accuracy,
        effectChance: move.effectChance,
        damageClass: move.damageClass,
        type: move.type.name,
      ),
    );
  }
}

class GenericInfo extends StatelessWidget {
  const GenericInfo({
    Key? key,
    required this.color,
    required this.description,
    required this.name,
    required this.type,
  }) : super(key: key);

  final Color color;
  final String description;
  final String name;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lighten(color, 25),
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: double.infinity,
      height: 150.0,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 4.0,
            ),
            width: double.infinity,
            child: Text(
              name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Svg(getTypeImage(type),
                      color: Colors.white.withOpacity(0.3)),
                  fit: BoxFit.fitHeight,
                  opacity: 0.3,
                ),
              ),
              child: Text(
                description.replaceAll(RegExp('\n'), ' '),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      shadows: textShadow,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExtraInfo extends StatelessWidget {
  const ExtraInfo({
    Key? key,
    required this.color,
    this.accuracy = 0,
    this.pp = 0,
    this.power,
    required this.target,
    this.effectChance,
    required this.damageClass,
    required this.type,
  }) : super(key: key);

  final Color color;
  final int pp;
  final int? power;
  final String target;
  final int? accuracy;
  final int? effectChance;
  final String damageClass;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lighten(color, 25),
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: Svg(getTypeImage(type), color: Colors.white.withOpacity(0.3)),
          fit: BoxFit.contain,
          opacity: 0.3,
        ),
      ),
      width: double.infinity,
      height: 150.0,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ValueLabel(
            label: 'PP',
            value: pp.toString(),
          ),
          if (damageClass == 'status')
            ValueLabel(
              label: 'Target',
              value: getTarget(target).toUpperCase(),
            )
          else
            ValueLabel(
              label: 'Power',
              value: power?.toString() ?? 'Varies',
            ),
          ValueLabel(
            label: 'Accuracy',
            value: '${accuracy?.toString() ?? 100}%',
          ),
          if (effectChance != null)
            ValueLabel(
              label: 'Chance',
              value: '${effectChance.toString()}%',
            ),
        ],
      ),
    );
  }
}

class ValueLabel extends StatelessWidget {
  const ValueLabel({Key? key, required this.label, required this.value})
      : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  shadows: textShadow,
                ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  shadows: textShadow,
                ),
          ),
        ],
      ),
    );
  }
}

String getTarget(String target) {
  switch (target) {
    case 'selected-pokemon':
    case 'selected-pokemon-me-first':
      return 'Single';
    case 'users-field':
    case 'all-allies':
      return 'Party';
    case 'opponents-field':
    case 'all-opponents':
      return 'Opponents';
    case 'specific-move':
      return 'Depends';
    case 'user-or-ally':
    case 'user-and-allies':
      return 'Friendly';
    case 'random-opponent':
      return 'Opponent';
    case 'all-other-pokemon':
      return 'Others';
    case 'entire-field':
    case 'all-pokemon':
      return 'All';
    default:
      return target;
  }
}
