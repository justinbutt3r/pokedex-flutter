import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/pokemonFetch/pokemon_fetch_cubit.dart';
import '../../../core/data/models/pokemon_item.dart';
import '../../shared/widgets/loader.dart';
import '../../shared/widgets/responsive_layout.dart';
import '../layouts/large_layout.dart';
import '../layouts/small_layout.dart';

class DetailLayout extends StatelessWidget {
  const DetailLayout({Key? key}) : super(key: key);

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

          return ResponsiveLayout(
            smallWidget: SmallLayout(pokemon: pokemon),
            largeWidget: LargeLayout(pokemon: pokemon),
          );
        }
        return Container();
      },
    );
  }
}
