import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/abilityList/ability_list_cubit.dart';
import '../../../core/data/pokemon_repository.dart';
import '../../../core/data/services/pokemon_service.dart';
import 'ability_list_layout.dart';

class AbilityListPage extends StatelessWidget {
  const AbilityListPage({Key? key, required this.pokemonService})
      : super(key: key);
  final PokemonService pokemonService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AbilityListCubit(
              pokemonRepository: PokemonRepository(
                service: pokemonService,
              ),
            )..getAbilityList(),
          ),
        ],
        child: const AbilityListLayout(),
      ),
    );
  }
}
