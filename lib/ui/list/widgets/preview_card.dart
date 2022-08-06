import 'package:flutter/material.dart';
import '../../../core/data/models/pokemon_summary.dart';
import '../../../core/models/detail_page_arguments.dart';
import '../../../utils/theme.dart';
import '../../../utils/types.dart';

class PreviewCard extends StatelessWidget {
  const PreviewCard({Key? key, required this.pokemon}) : super(key: key);
  final PokemonSummary pokemon;

  @override
  Widget build(BuildContext context) {
    final String firstType = pokemon.types[0].name;

    final Color splash = getTypeColor(firstType);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(1, 1), // changes position of shadow,
          ),
        ],
        color: Colors.grey[800],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: splash.withOpacity(0.3),
          highlightColor: splash.withOpacity(0.3),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/detail',
              arguments: DetailPageArguments(id: pokemon.apiId),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 1.0,
                ),
                width: double.infinity,
                color: Colors.grey,
                child: Text(
                  pokemon.pokemonId > -1
                      ? pokemon.pokemonId.toString().padLeft(3, '0')
                      : '000',
                  style: labelTextStyle,
                ),
              ),
              if (pokemon.image.isNotEmpty)
                Image.network(
                  pokemon.image,
                )
              else
                Image.asset(
                  'assets/images/open-pokeball.png',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
