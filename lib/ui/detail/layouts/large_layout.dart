import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';

import '../../../core/data/models/pokemon_item.dart';
import '../../../core/data/models/pokemon_move_reference.dart';
import '../../shared/widgets/page_heading.dart';
import '../widgets/battled_condition.dart';
import '../widgets/description_widget.dart';
import '../widgets/evolution_row.dart';
import '../widgets/move_grid.dart';
import '../widgets/other_forms.dart';
import '../widgets/pokemon_abilities.dart';
import '../widgets/sidebar.dart';
import '../widgets/variant_row.dart';
import '../widgets/voiceline_player.dart';

class LargeLayout extends StatelessWidget {
  const LargeLayout({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final List<PokemonMoveReference> pokemonMoves = pokemon.moves;
    pokemonMoves.sort((a, b) => a.atLevel - b.atLevel);
    final controller = ScrollController();

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 32.0),
              child: Column(
                children: [
                  PageHeading(
                    title: pokemon.name,
                  ),
                  Expanded(
                    child: FadingEdgeScrollView.fromSingleChildScrollView(
                      child: SingleChildScrollView(
                        controller: controller,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VoicelinePlayer(
                              voiceLine: pokemon.voiceLine,
                            ),
                            DetailDescription(
                              description: pokemon.description,
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                              ),
                            ),
                            if (pokemon.forms.isNotEmpty)
                              OtherForms(
                                forms: pokemon.forms,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                              ),
                            Container(
                              constraints: const BoxConstraints(
                                maxWidth: 860,
                              ),
                              child: PokemonAbilities(
                                pokemonAbilities: pokemon.abilities,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                              ),
                            ),
                            BattleCondition(
                              pokemonTypes: pokemon.types,
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                              ),
                            ),
                            MoveGrid(
                              list: pokemonMoves,
                            ),
                            EvolutionRow(
                              evolutionList: pokemon.evolutionItem,
                              currentSelected: pokemon.apiId,
                            ),
                            VariantRow(
                              variants: pokemon.varieties,
                              currentFormName: pokemon.formName,
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                              ),
                              maxCrossAxisExtent: 500.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SideBar(
            pokemon: pokemon,
          ),
        ],
      ),
    );
  }
}
