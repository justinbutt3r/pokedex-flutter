import 'package:json_annotation/json_annotation.dart';

import 'pokemon_ability.dart';
import 'pokemon_evolution_item.dart';
import 'pokemon_form_details.dart';
import 'pokemon_move_reference.dart';
import 'pokemon_type.dart';
import 'pokemon_variety_reference.dart';

part 'pokemon_item.g.dart';

@JsonSerializable()
class Pokemon {
  // final List? moves;
  // final List? forms;
  // final List? evolution;
  // final List? varieties;

  Pokemon({
    required this.types,
    required this.abilities,
    required this.name,
    required this.apiName,
    required this.apiId,
    this.pokemonId = -1,
    this.image = '',
    required this.description,
    required this.weight,
    required this.height,
    required this.hp,
    required this.atk,
    required this.def,
    required this.satk,
    required this.sdef,
    required this.spd,
    required this.species,
    required this.gender,
    required this.hasGenderDifferences,
    required this.isLegendary,
    required this.isMythical,
    required this.isDefault,
    required this.generation,
    this.evolutionItem,
    this.voiceLine = '',
    required this.moves,
    this.formName = '',
    this.forms = const [],
    // this.evolution,
    this.varieties = const [],
  });
  final List<PokemonType> types;
  final List<PokemonAbility> abilities;
  final List<PokemonMoveReference> moves;
  final String name;
  final String apiName;
  final int apiId;
  final int pokemonId;
  final String image;
  final String description;
  final int weight;
  final int height;
  final int hp;
  final int atk;
  final int def;
  final int satk;
  final int sdef;
  final int spd;
  final String species;
  final int gender;
  final bool hasGenderDifferences;
  final bool isLegendary;
  final bool isMythical;
  final bool isDefault;
  final int generation;
  final PokemonEvolutionItem? evolutionItem;
  final String voiceLine;
  final List<PokemonVarietyReference> varieties;
  final String formName;
  final List<PokemonFormDetails> forms;

  // ignore: sort_constructors_first
  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
