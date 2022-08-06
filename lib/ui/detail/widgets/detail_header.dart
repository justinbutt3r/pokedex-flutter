import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../core/data/models/pokemon_item.dart';
import 'category_button.dart';
import 'header_info.dart';
import 'type_gradient.dart';
import 'voiceline_player.dart';

class DetailHeader implements SliverPersistentHeaderDelegate {
  DetailHeader({
    required this.maxExtent,
    required this.minExtent,
    required this.pokemon,
    required this.onPageClick,
    this.currentPage = 0,
    this.voiceLine = '',
  });
  @override
  final double maxExtent;
  @override
  final double minExtent;
  final Pokemon pokemon;
  final void Function(int pageNumber) onPageClick;
  final int currentPage;
  final String voiceLine;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double opacity =
        1.0 - max(0.0, shrinkOffset) / (maxExtent - minExtent);
    double containerHeight = (maxExtent - minExtent) * opacity;
    containerHeight = containerHeight > 0.0 ? containerHeight : 0.0;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        VoicelinePlayer(
          voiceLine: voiceLine,
        ),
        TypeGradient(
          pokemonTypes: pokemon.types,
        ),
        Positioned(
          top: 60.0,
          left: 0,
          child: HeaderInfo(
            name: pokemon.name,
            pokemonId: pokemon.pokemonId,
            species: pokemon.species,
            pokemonTypes: pokemon.types,
          ),
        ),
        Positioned(
          bottom: 0,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CategoryButton(
                  title: 'Info',
                  isActive: currentPage == 0,
                  onClick: onPageClick,
                ),
                CategoryButton(
                  title: 'Evolution',
                  isActive: currentPage == 1,
                  onClick: onPageClick,
                  pageNumber: 1,
                ),
                CategoryButton(
                  title: 'Moves',
                  isActive: currentPage == 2,
                  onClick: onPageClick,
                  pageNumber: 2,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 115,
          height: 235 - min(shrinkOffset, 100),
          width: MediaQuery.of(context).size.width,
          child: SizedBox(
            height: containerHeight,
            width: MediaQuery.of(context).size.width,
            child: (pokemon.image.isNotEmpty)
                ? Image.network(
                    pokemon.image,
                  )
                : Image.asset(
                    'assets/images/open-pokeball.png',
                  ),
          ),
        )
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}
