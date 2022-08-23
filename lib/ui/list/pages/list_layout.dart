import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/pokemonList/pokemon_list_cubit.dart';
import '../../shared/widgets/error_widget.dart';
import '../../shared/widgets/loader.dart';
import '../../shared/widgets/page_heading.dart';
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
          return Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
            child: Column(
              children: [
                PageHeading(title: label),
                Expanded(
                  child: PreviewGrid(
                    pokemonList: state.pokemonList,
                  ),
                ),
              ],
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
