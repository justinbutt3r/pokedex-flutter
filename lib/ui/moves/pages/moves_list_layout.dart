import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/moveList/move_list_cubit.dart';
import '../../../core/data/models/pokemon_move.dart';
import '../../../utils/breakpoints.dart';
import '../../shared/widgets/error_widget.dart';
import '../../shared/widgets/loader.dart';
import '../../shared/widgets/move_item.dart';
import '../../shared/widgets/page_heading.dart';

class MovesListLayout extends StatelessWidget {
  const MovesListLayout({Key? key, this.label = 'Moves'}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoveListCubit, MoveListState>(
      builder: (BuildContext context, state) {
        if (state is MoveListLoading) {
          return const Center(
            child: Loader(),
          );
        } else if (state is MoveListError) {
          return Center(
            child: PokemonErrorWidget(
              message: state.message,
            ),
          );
        } else if (state is MoveListLoaded && state.moveList.isNotEmpty) {
          final controller = ScrollController();
          return Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
            child: Column(
              children: [
                PageHeading(title: label),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      int count = 1;
                      if (constraints.maxWidth > extraLarge) {
                        count = 4;
                      } else if (constraints.maxWidth > large) {
                        count = 3;
                      } else if (constraints.maxWidth > medium) {
                        count = 2;
                      }
                      return FadingEdgeScrollView.fromScrollView(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: count,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                            childAspectRatio: 2.4,
                            mainAxisExtent: 150.0,
                          ),
                          controller: controller,
                          padding: EdgeInsets.zero,
                          itemCount: state.moveList.length,
                          itemBuilder: (context, index) {
                            final PokemonMove move = state.moveList[index];
                            return MoveItem(move: move);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
