import 'package:flutter/material.dart';
import 'core/data/services/pokemon_service.dart';
import 'ui/detail/pages/detail_page.dart';
import 'ui/home/pages/home_page.dart';
import 'ui/list/pages/list_page.dart';

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
        '/list': (context) => ListPage(pokemonService: pokemonService),
        '/detail': (context) => DetailPage(pokemonService: pokemonService),
      },
    );
  }
}
