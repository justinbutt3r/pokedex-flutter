import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/data/models/pokemon_type.dart';
import '../../../utils/string_extensions.dart';
import '../../../utils/theme.dart';
import '../../../utils/types.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({
    Key? key,
    required this.name,
    required this.pokemonId,
    required this.species,
    required this.pokemonTypes,
    this.hideArrow = false,
  }) : super(key: key);
  final String name;
  final int pokemonId;
  final String species;
  final List<PokemonType> pokemonTypes;
  final bool hideArrow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (!hideArrow)
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          shadows: textShadow,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ],
              ),
              Text(
                pokemonId.toString().padLeft(3, '0'),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      shadows: textShadow,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (!hideArrow)
                    const SizedBox(
                      width: 25.0,
                    ),
                  Text(
                    species,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          shadows: textShadow,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ],
              ),
              Row(
                children: pokemonTypes
                    .map(
                      (t) => Container(
                        width: 20.0,
                        height: 20.0,
                        padding: const EdgeInsets.all(1.5),
                        child: Tooltip(
                          message: t.name.toCapitalized(),
                          child: SvgPicture.asset(
                            getTypeImage(t.name),
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
