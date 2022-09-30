import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/data/models/pokemon_type.dart';
import '../../../core/models/type_effectiveness.dart';
import '../../../utils/breakpoints.dart';
import '../../../utils/effectiveness.dart';
import '../../../utils/helpers.dart';
import '../../../utils/theme.dart';
import '../../../utils/types.dart';

class BattleCondition extends StatelessWidget {
  const BattleCondition({
    Key? key,
    required this.pokemonTypes,
    this.padding = const EdgeInsets.all(16.0),
  }) : super(key: key);
  final List<PokemonType> pokemonTypes;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final Map<String, List<TypeEffectiveness>> defense =
        defenseEffectiveCalculator(pokemonTypes);

    final childList = [
      if ((defense['weak']!).isNotEmpty)
        BattleConditionGrid(
          typeList: defense['weak'] ?? [],
          title: 'Weak to',
        ),
      if ((defense['strong']!).isNotEmpty)
        BattleConditionGrid(
          typeList: defense['strong'] ?? [],
          title: 'Resistant to',
        ),
      if ((defense['immune']!).isNotEmpty)
        BattleConditionGrid(
          typeList: defense['immune'] ?? [],
          title: 'Immune to',
        ),
    ];
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Battle Conditions',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: sizeBetween,
          ),
          ...childList,
        ],
      ),
    );
  }
}

class BattleConditionGrid extends StatelessWidget {
  const BattleConditionGrid({
    Key? key,
    required this.typeList,
    required this.title,
  }) : super(key: key);
  final List<TypeEffectiveness> typeList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final int count = constraints.maxWidth > large ? 5 : 3;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            GridView.builder(
              padding: const EdgeInsets.only(top: 20.0, bottom: 32.0),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: count,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 10.0,
                mainAxisExtent: 50.0,
              ),
              itemCount: typeList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final TypeEffectiveness type = typeList[index];
                return BattleCondtionItem(
                  type: type,
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class BattleCondtionItem extends StatelessWidget {
  const BattleCondtionItem({Key? key, required this.type}) : super(key: key);
  final TypeEffectiveness type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.0,
      height: 50.0,
      child: Stack(
        children: [
          Positioned(
            top: 5.0,
            left: 40.0,
            child: Container(
              width: 70.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(100.0),
                  topRight: Radius.circular(100.0),
                ),
                color: Theme.of(context).indicatorColor,
              ),
              child: Center(
                child: Text(
                  '${removeDecimalZeroFormat(type.value)}X',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ),
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: getTypeColor(type.name),
            ),
            child: Center(
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: SvgPicture.asset(
                  getTypeImage(type.name),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
