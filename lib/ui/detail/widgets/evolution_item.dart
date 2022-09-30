import 'package:flutter/material.dart';

import '../../../core/data/models/pokemon_type.dart';
import '../../../core/models/detail_page_arguments.dart';
import 'type_gradient.dart';

class EvolutionItem extends StatelessWidget {
  const EvolutionItem({
    Key? key,
    this.image = '',
    required this.id,
    required this.pokemonTypes,
    this.sideMargin = false,
    this.selected = false,
    this.mini = false,
  }) : super(key: key);
  final List<PokemonType> pokemonTypes;
  final String image;
  final int id;
  final bool sideMargin;
  final bool selected;
  final bool mini;
  @override
  Widget build(BuildContext context) {
    final double sideMar = (sideMargin == true) ? 32.0 : 0;
    final double size = mini ? 150 : 250;
    return Center(
      child: Container(
        width: size,
        height: size,
        margin: EdgeInsets.only(
          right: sideMar,
          bottom: 32.0,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            if (selected)
              const BoxShadow(
                color: Color.fromRGBO(255, 215, 0, 0.25),
                spreadRadius: 5,
                blurRadius: 10,
              ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(300),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(300),
          ),
          child: InkWell(
            onTap: () {
              Navigator.popAndPushNamed(
                context,
                '/detail',
                arguments: DetailPageArguments(id: id),
              );
            },
            child: Stack(
              children: <Widget>[
                TypeGradient(pokemonTypes: pokemonTypes),
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.75,
                    heightFactor: 0.75,
                    child: (image.isNotEmpty)
                        ? Image.network(
                            image,
                          )
                        : Image.asset(
                            'assets/images/open-pokeball.png',
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
