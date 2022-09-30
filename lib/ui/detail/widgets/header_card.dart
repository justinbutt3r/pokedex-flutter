import 'package:flutter/material.dart';

import '../../../core/data/models/pokemon_item.dart';
import 'header_info.dart';
import 'type_gradient.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: SizedBox(
        height: 320.0,
        width: 320.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            TypeGradient(
              pokemonTypes: pokemon.types,
            ),
            Positioned(
              top: 70,
              left: 35,
              child: SizedBox(
                height: 250,
                width: 250,
                child: (pokemon.image.isNotEmpty)
                    ? Image.network(
                        pokemon.image,
                      )
                    : Image.asset(
                        'assets/images/open-pokeball.png',
                      ),
              ),
            ),
            Positioned(
              top: 32.0,
              left: 0,
              child: SizedBox(
                width: 320,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HeaderInfo(
                    name: pokemon.name,
                    pokemonId: pokemon.pokemonId,
                    species: pokemon.species,
                    pokemonTypes: pokemon.types,
                    hideArrow: true,
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
