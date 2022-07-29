import 'models/pokemon_item.dart';
import 'services/pokemon_service.dart';

class PokemonRepository {
  const PokemonRepository({
    required this.service,
  });

  final PokemonService service;

  Future<Pokemon> getPokemon(int id) async => service.getPokemon(id);

  Future<List<Pokemon>> getAllPokemon(int generation) async =>
      service.getPokemonByGeneration(generation);
}
