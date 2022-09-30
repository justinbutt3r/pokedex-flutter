import 'package:flutter/material.dart';
import '../../../core/data/models/pokemon_item.dart';
import '../../../utils/types.dart';
import 'generic_info.dart';
import 'header_card.dart';
import 'stat_list.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    final Color color = getTypeColor(pokemon.types[0].name);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      width: 320.0,
      height: 640.0,
      child: Column(
        children: [
          HeaderCard(pokemon: pokemon),
          GenericInfo(
            weight: pokemon.weight,
            height: pokemon.height,
          ),
          StatList(
            hp: pokemon.hp,
            atk: pokemon.atk,
            def: pokemon.def,
            satk: pokemon.satk,
            sdef: pokemon.sdef,
            spd: pokemon.spd,
            color: color,
            baseWidth: 340,
          ),
        ],
      ),
    );
  }
}
