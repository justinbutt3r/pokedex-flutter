import 'package:flutter/material.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({Key? key, this.image = ''}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    if (image.isNotEmpty) {
      return Image.network(
        image,
      );
    }
    return Image.asset(
      'assets/images/open-pokeball.png',
    );
  }
}
