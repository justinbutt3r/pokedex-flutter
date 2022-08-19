import 'models/pokemon_ability.dart';
import 'models/pokemon_item.dart';
import 'models/pokemon_move.dart';
import 'models/pokemon_summary.dart';
import 'services/pokemon_service.dart';

class PokemonRepository {
  const PokemonRepository({
    required this.service,
  });

  final PokemonService service;

  Future<Pokemon> getPokemon(int id) async => service.getPokemon(id);

  Future<List<PokemonSummary>> getAllPokemon(int generation) async =>
      service.getPokemonByGeneration(generation);

  Future<List<PokemonSummary>> getAllPokemonByType(String type) async =>
      service.getPokemonByType(type);

  Future<List<PokemonSummary>> getAllPokemonByFlag(
          {bool? isMythical, bool? isLegendary}) async =>
      service.getPokemonByFlag(
          isMythical: isMythical, isLegendary: isLegendary);

  Future<List<PokemonMove>> getAllMoves() async => service.getMoves();

  Future<List<PokemonMove>> getMovesWithEffect() async =>
      service.getMovesWithEffect();

  Future<List<PokemonMove>> getMovesByType(String type) async =>
      service.getMovesByType(type);

  Future<List<PokemonMove>> getMovesByDamageClass(String damageClass) async =>
      service.getMovesByDamageClass(damageClass);

  Future<List<PokemonAbility>> getAllAbilities() async =>
      service.getAbilities();
}
