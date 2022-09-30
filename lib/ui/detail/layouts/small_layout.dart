import 'package:flutter/material.dart';

import '../../../core/data/models/pokemon_item.dart';
import '../../../core/data/models/pokemon_move_reference.dart';
import '../../../utils/types.dart';
import '../widgets/battled_condition.dart';
import '../widgets/description_widget.dart';
import '../widgets/detail_header.dart';
import '../widgets/evolution_list.dart';
import '../widgets/generic_info.dart';
import '../widgets/move_list.dart';
import '../widgets/other_forms.dart';
import '../widgets/pokemon_abilities.dart';
import '../widgets/stat_list.dart';
import '../widgets/variant_row.dart';

class SmallLayout extends StatefulWidget {
  const SmallLayout({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  State<SmallLayout> createState() => _SmallLayoutState();
}

class _SmallLayoutState extends State<SmallLayout> {
  final PageController _pageController = PageController();
  int currentPageValue = 0;

  void goToPage(int pageNumber) {
    setState(() {
      _pageController.animateToPage(pageNumber,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      currentPageValue = pageNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon = widget.pokemon;

    final Color color = getTypeColor(pokemon.types[0].name);
    final List<PokemonMoveReference> pokemonMoves = pokemon.moves;
    pokemonMoves.sort((a, b) => a.atLevel - b.atLevel);
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverPersistentHeader(
              pinned: true,
              delegate: DetailHeader(
                maxExtent: 400.0,
                minExtent: 300.0,
                pokemon: pokemon,
                onPageClick: goToPage,
                currentPage: currentPageValue,
                voiceLine: pokemon.voiceLine,
              ),
            )
          ];
        },
        body: PageView(
          controller: _pageController,
          onPageChanged: (number) {
            setState(() {
              currentPageValue = number;
            });
          },
          children: [
            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      DetailDescription(
                        description: pokemon.description,
                      ),
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
                      ),
                      if (pokemon.forms.isNotEmpty)
                        OtherForms(
                          forms: pokemon.forms,
                        ),
                      PokemonAbilities(
                        pokemonAbilities: pokemon.abilities,
                      ),
                      BattleCondition(
                        pokemonTypes: pokemon.types,
                      ),
                      VariantRow(
                        variants: pokemon.varieties,
                        currentFormName: pokemon.formName,
                      )
                    ],
                  ),
                ),
              ],
            ),
            EvolutionList(
              evolutionList: pokemon.evolutionItem,
              currentSelected: pokemon.apiId,
            ),
            MoveList(list: pokemonMoves),
          ],
        ),
      ),
    );
  }
}
