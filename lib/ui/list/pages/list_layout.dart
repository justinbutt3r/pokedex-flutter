import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/pokemonList/pokemon_list_cubit.dart';
import '../../../utils/theme.dart';
import '../../shared/widgets/error_widget.dart';
import '../../shared/widgets/loader.dart';
import '../widgets/preview_grid.dart';

class ListLayout extends StatelessWidget {
  const ListLayout(
      {Key? key, required this.scaffoldReference, required this.label})
      : super(key: key);
  final String label;
  final GlobalKey<ScaffoldState> scaffoldReference;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListCubit, PokemonListState>(
      builder: (BuildContext context, state) {
        if (state is PokemonListLoading) {
          return const Center(
            child: Loader(),
          );
        } else if (state is PokemonListError) {
          return Center(
            child: PokemonErrorWidget(
              message: state.message,
            ),
          );
        } else if (state is PokemonListLoaded && state.pokemonList.isNotEmpty) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back_ios),
                          ),
                          Text(
                            label,
                            style: largeTextStyle,
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 10.0,
                        children: [
                          InkWell(
                            onTap: () {
                              scaffoldReference.currentState?.openEndDrawer();
                            },
                            child: const Icon(
                              Icons.filter_list,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: PreviewGrid(
                      pokemonList: state.pokemonList,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const Center(
          child: PokemonErrorWidget(
            message: 'No Pokemon found',
          ),
        );
      },
    );
  }
}
