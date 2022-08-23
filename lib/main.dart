import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/data/services/pokemon_service.dart';
import 'core/services/theme_manager.dart';
import 'routes.dart';
import 'ui/theme/dark_theme.dart';
import 'ui/theme/light_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
      pokemonService: PokemonService(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.pokemonService}) : super(key: key);
  final PokemonService pokemonService;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeNotifier>(context);
        inspect(themeProvider);
        if (themeProvider.valueSet) {
          return MaterialApp(
            title: 'Pokedex',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            initialRoute: '/',
            routes: routes(pokemonService),
          );
        }
        return Container();
      },
    );
  }
}
