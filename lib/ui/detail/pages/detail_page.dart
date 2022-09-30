import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/blocs/pokemonFetch/pokemon_fetch_cubit.dart';
import '../../../core/data/pokemon_repository.dart';
import '../../../core/data/services/pokemon_service.dart';
import '../../../core/models/detail_page_arguments.dart';
import 'detail_layout.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.pokemonService}) : super(key: key);
  final PokemonService pokemonService;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as DetailPageArguments?;
    // ignore: unnecessary_null_comparison
    // ignore: unused_local_variable
    final int id = (args != null) ? args.id : 6;
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PokemonFetchCubit(
              pokemonRepository: PokemonRepository(
                service: pokemonService,
              ),
            )..getPokemon(id),
          ),
        ],
        child: const DetailLayout(),
      ),
    );
  }
}
