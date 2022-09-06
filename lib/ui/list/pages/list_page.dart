import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/pokemonList/pokemon_list_cubit.dart';
import '../../../core/data/pokemon_repository.dart';
import '../../../core/data/services/pokemon_service.dart';
import '../../../core/models/list_page_arguments.dart';
import '../../../utils/string_extensions.dart';
import '../widgets/filter_drawer.dart';
import 'list_layout.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key, required this.pokemonService}) : super(key: key);
  final PokemonService pokemonService;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final LPA =
        // ignore: cast_nullable_to_non_nullable
        ModalRoute.of(context)?.settings.arguments;

    final args = LPA != null ? LPA as ListPageArgument : ListPageArgument();
    final int? generation = args.generation;
    final String? type = args.type;
    final bool? isMythical = args.mythical;
    final bool? isLegendary = args.legendary;

    _scaffoldKey.currentState?.openDrawer();
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const FilterDrawer(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<PokemonListCubit>(
            create: (context) => PokemonListCubit(
              pokemonRepository: PokemonRepository(service: pokemonService),
            )..getPokemonList(
                generation: generation,
                type: type,
                isLegendary: isLegendary,
                isMythical: isMythical,
              ),
          ),
        ],
        child: ListLayout(
            label: getLabel(
              generation: generation,
              type: type,
              isLegendary: isLegendary,
              isMythical: isMythical,
            ),
            scaffoldReference: _scaffoldKey),
      ),
    );
  }
}

String getLabel(
    {int? generation, String? type, bool? isMythical, bool? isLegendary}) {
  if (generation != null) {
    return 'Generation ${generation.toString()}';
  }

  if (type != null) {
    return type.toCapitalized();
  }

  if (isMythical != null) {
    return 'Mythical';
  }

  if (isLegendary != null) {
    return 'Legendary';
  }

  return '';
}
