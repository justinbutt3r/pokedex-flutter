import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/data/models/pokemon_summary.dart';
import '../../../core/data/models/pokemon_type.dart';
import '../../../core/data/models/pokemon_variety_reference.dart';
import '../../../utils/theme.dart';
import '../../../utils/types.dart';
import '../../shared/widgets/card_flip.dart';
import '../../shared/widgets/pokemon_image.dart';
import 'stat_list.dart';
import 'type_gradient.dart';

class VariantRow extends StatelessWidget {
  const VariantRow({
    Key? key,
    required this.variants,
    required this.currentFormName,
    this.padding = const EdgeInsets.all(16.0),
    this.maxCrossAxisExtent = 300.0,
  }) : super(key: key);

  final List<PokemonVarietyReference> variants;
  final String currentFormName;
  final EdgeInsets padding;
  final double maxCrossAxisExtent;

  @override
  Widget build(BuildContext context) {
    if (variants.isEmpty) {
      return Container();
    }

    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Variants',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: sizeBetween,
          ),
          GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: variants.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: maxCrossAxisExtent,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              final PokemonVarietyReference reference = variants[index];
              final PokemonSummary pokemon = reference.pokemon;
              final List<PokemonType> types = pokemon.types
                  .map((e) => PokemonType(id: e.id, name: e.name))
                  .toList();
              final Color color = getTypeColor(types[0].name);

              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Text(
                      pokemon.formName,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        TypeGradient(pokemonTypes: types),
                        Center(
                          child: FractionallySizedBox(
                            widthFactor: 0.85,
                            heightFactor: 0.85,
                            child: CardFlip(
                              front: PokemonImage(
                                image: pokemon.image,
                              ),
                              back: LayoutBuilder(
                                builder: (context, constraints) {
                                  inspect(constraints);
                                  return StatListMini(
                                    baseWidth: constraints.maxWidth,
                                    hp: pokemon.hp,
                                    atk: pokemon.atk,
                                    def: pokemon.def,
                                    satk: pokemon.satk,
                                    sdef: pokemon.sdef,
                                    spd: pokemon.spd,
                                    color: color,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}


// ...variants.map(
              //   (reference) {
              //     final PokemonSummary pokemon = reference.pokemon;
              //     final List<PokemonType> types = pokemon.types
              //         .map((e) => PokemonType(id: e.id, name: e.name))
              //         .toList();
              //     return Container(
              //       width: 150,
              //       height: 210,
              //       margin: const EdgeInsets.only(
              //         right: sizeBetween,
              //       ),
              //       child: Column(
              //         children: [
              //           SizedBox(
              //             width: 150,
              //             height: 50,
              //             child: Center(
              //               child: Text(
              //                 pokemon.formName,
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .labelMedium
              //                     ?.copyWith(
              //                       shadows: textShadow,
              //                     ),
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             width: 150,
              //             height: 150,
              //             child: ClipRRect(
              //               borderRadius: const BorderRadius.all(
              //                 Radius.circular(300),
              //               ),
              //               child: InkWell(
              //                 onTap: () {
              //                   Navigator.popAndPushNamed(
              //                     context,
              //                     '/detail',
              //                     arguments:
              //                         DetailPageArguments(id: pokemon.apiId),
              //                   );
              //                 },
              //                 child: Stack(
              //                   children: [
              //                     TypeGradient(pokemonTypes: types),
              //                     Center(
              //                       child: FractionallySizedBox(
              //                         widthFactor: 0.75,
              //                         heightFactor: 0.75,
              //                         child: (pokemon.image.isNotEmpty)
              //                             ? Image.network(
              //                                 pokemon.image,
              //                               )
              //                             : Image.asset(
              //                                 'assets/images/open-pokeball.png',
              //                               ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ).toList(),
