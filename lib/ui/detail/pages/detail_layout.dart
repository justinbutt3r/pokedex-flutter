import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/pokemonFetch/pokemon_fetch_cubit.dart';
import '../../../core/data/models/pokemon_item.dart';
import '../../../core/data/models/pokemon_move_reference.dart';
import '../../../utils/types.dart';
import '../../shared/widgets/loader.dart';
import '../widgets/battled_condition.dart';
import '../widgets/description_widget.dart';
import '../widgets/detail_header.dart';
import '../widgets/evolution_list.dart';
import '../widgets/generic_info.dart';
import '../widgets/move_list.dart';
import '../widgets/pokemon_abilities.dart';
import '../widgets/stat_list.dart';

class DetailLayout extends StatefulWidget {
  const DetailLayout({Key? key}) : super(key: key);

  @override
  State<DetailLayout> createState() => _DetailLayoutState();
}

class _DetailLayoutState extends State<DetailLayout> {
  final PageController _pageController = PageController();
  int currentPageValue = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void goToPage(int pageNumber) {
    setState(() {
      _pageController.animateToPage(pageNumber,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      currentPageValue = pageNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonFetchCubit, PokemonFetchState>(
      builder: (context, state) {
        if (state is PokemonFetchLoading) {
          return const Center(
            child: Loader(),
          );
        } else if (state is PokemonFetchError) {
          return Center(
            child: Text(
              state.message,
            ),
          );
        } else if (state is PokemonFetchLoaded) {
          final Pokemon pokemon = state.pokemon;
          final Color color = getTypeColor(pokemon.types[0].name);
          final List<PokemonMoveReference> pokemonMoves = pokemon.moves;
          pokemonMoves.sort((a, b) => a.atLevel - b.atLevel);

          return DefaultTabController(
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
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
                            PokemonAbilities(
                              pokemonAbilities: pokemon.abilities,
                            ),
                            BattleCondition(
                              pokemonTypes: pokemon.types,
                            ),
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
        return Container();
      },
    );
  }
}
