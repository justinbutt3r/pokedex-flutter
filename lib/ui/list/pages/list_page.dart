import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/blocs/pokemonList/pokemon_list_cubit.dart';
import '../../../core/data/pokemon_repository.dart';
import '../../../core/data/services/pokemon_service.dart';
import '../../../core/models/list_page_arguments.dart';
import '../widgets/filter_drawer.dart';
import 'list_layout.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key, required this.pokemonService}) : super(key: key);
  final PokemonService pokemonService;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as ListPageArgument?;
    // ignore: unnecessary_null_comparison
    final int generation = (args != null) ? args.generation : 1;
    _scaffoldKey.currentState?.openDrawer();
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const FilterDrawer(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<PokemonListCubit>(
            create: (context) => PokemonListCubit(
              pokemonRepository: PokemonRepository(service: pokemonService),
            )..getPokemonList(generation),
          ),
        ],
        child:
            ListLayout(generation: generation, scaffoldReference: _scaffoldKey),
      ),
    );
  }
}
