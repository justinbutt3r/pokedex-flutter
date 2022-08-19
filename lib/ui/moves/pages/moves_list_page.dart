import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/moveList/move_list_cubit.dart';
import '../../../core/data/pokemon_repository.dart';
import '../../../core/data/services/pokemon_service.dart';
import '../../../core/models/move_list_page_arguments.dart';
import '../../../utils/string_extensions.dart';
import 'moves_list_layout.dart';

class MovesListPage extends StatelessWidget {
  const MovesListPage({Key? key, required this.pokemonService})
      : super(key: key);
  final PokemonService pokemonService;

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments != null)
        ?
        // ignore: cast_nullable_to_non_nullable
        ModalRoute.of(context)?.settings.arguments as MoveListPageArguments
        : MoveListPageArguments();

    final String? type = args.type;
    final String? damageClass = args.damageClass;
    final bool effectChance = args.effectChance;

    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MoveListCubit(
              pokemonRepository: PokemonRepository(
                service: pokemonService,
              ),
            )..getMovesList(
                type: type,
                damageClass: damageClass,
                effectChance: effectChance,
              ),
          ),
        ],
        child: MovesListLayout(
          label: getLabel(
            effectChance: effectChance,
            type: type,
            damageClass: damageClass,
          ),
        ),
      ),
    );
  }
}

String getLabel(
    {String? type, String? damageClass, required bool effectChance}) {
  if (type != null) {
    return type.toCapitalized();
  }

  if (damageClass != null) {
    return damageClass.toCapitalized();
  }

  if (effectChance) {
    return 'Moves with effects';
  }

  return 'Moves';
}
