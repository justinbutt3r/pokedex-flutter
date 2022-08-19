import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'core/data/services/pokemon_service.dart';
import 'core/models/list_page_arguments.dart';
import 'core/models/move_list_page_arguments.dart';
import 'ui/ability_list/pages/ability_list_page.dart';
import 'ui/detail/pages/detail_page.dart';
import 'ui/home/pages/generation_page.dart';
import 'ui/home/pages/home_page.dart';
import 'ui/home/pages/move_types_page.dart';
import 'ui/home/pages/pokemon_types_page.dart';
import 'ui/list/pages/list_page.dart';
import 'ui/moves/pages/moves_list_page.dart';

void main() {
  runApp(MyApp(
    pokemonService: PokemonService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.pokemonService}) : super(key: key);
  final PokemonService pokemonService;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xff0a0e21),
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/pokemon/gen': (context) => const GenerationPage(),
        '/pokemon/type': (context) => const PokemonTypesPage(),
        '/pokemon/mythical': (context) => PokemonListRoute(
              route: '/list',
              listPageArgument: ListPageArgument(mythical: true),
            ),
        '/pokemon/legendary': (context) => PokemonListRoute(
              route: '/list',
              listPageArgument: ListPageArgument(legendary: true),
            ),
        '/moves/type': (context) => const MoveTypesPage(),
        '/moves/list': (context) =>
            MovesListPage(pokemonService: pokemonService),
        '/moves/effect': (context) => MoveListRoute(
              route: '/moves/list',
              moveListPageArgument: MoveListPageArguments(effectChance: true),
            ),
        '/moves/status': (context) => MoveListRoute(
              route: '/moves/list',
              moveListPageArgument:
                  MoveListPageArguments(damageClass: 'status'),
            ),
        '/moves/special': (context) => MoveListRoute(
              route: '/moves/list',
              moveListPageArgument:
                  MoveListPageArguments(damageClass: 'special'),
            ),
        '/moves/physical': (context) => MoveListRoute(
              route: '/moves/list',
              moveListPageArgument:
                  MoveListPageArguments(damageClass: 'physical'),
            ),
        '/abilities/all': (context) =>
            AbilityListPage(pokemonService: pokemonService),
        '/list': (context) => ListPage(pokemonService: pokemonService),
        '/detail': (context) => DetailPage(pokemonService: pokemonService),
      },
    );
  }
}

class PokemonListRoute extends StatelessWidget {
  const PokemonListRoute(
      {Key? key, required this.route, required this.listPageArgument})
      : super(key: key);

  final String route;
  final ListPageArgument listPageArgument;

  @override
  Widget build(BuildContext context) {
    inspect(listPageArgument);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.popAndPushNamed(
        context,
        route,
        arguments: listPageArgument,
      );
    });

    return Container();
  }
}

class MoveListRoute extends StatelessWidget {
  const MoveListRoute(
      {Key? key, required this.route, required this.moveListPageArgument})
      : super(key: key);

  final String route;
  final MoveListPageArguments moveListPageArgument;

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.popAndPushNamed(
        context,
        route,
        arguments: moveListPageArgument,
      );
    });

    return Container();
  }
}
