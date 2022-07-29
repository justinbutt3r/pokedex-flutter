import 'package:flutter/material.dart';
import '../../../core/data/models/pokemon_type.dart';
import '../../../utils/types.dart';

class TypeGradient extends StatelessWidget {
  const TypeGradient({Key? key, required this.pokemonTypes}) : super(key: key);
  final List<PokemonType> pokemonTypes;

  @override
  Widget build(BuildContext context) {
    final List<Color> colorList =
        pokemonTypes.map((t) => getTypeColor(t.name)).toList();

    return Container(
      decoration: BoxDecoration(
          gradient: colorList.length > 1
              ? LinearGradient(
                  colors: colorList,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                )
              : null,
          color: colorList.length == 1 ? colorList[0] : null),
    );
  }
}
