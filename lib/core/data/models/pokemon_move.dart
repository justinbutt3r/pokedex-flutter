import 'package:json_annotation/json_annotation.dart';

import 'pokemon_type_reference.dart';

part 'pokemon_move.g.dart';

@JsonSerializable()
class PokemonMove {
  PokemonMove({
    required this.name,
    this.accuracy,
    required this.damageClass,
    this.effectChance,
    required this.description,
    required this.type,
    required this.target,
    this.power,
    required this.pp,
  });

  final String name;
  final int? accuracy;
  final String damageClass;
  final int? effectChance;
  final String description;
  final PokemonTypeReference type;
  final String target;
  final int? power;
  final int pp;

  // ignore: sort_constructors_first
  factory PokemonMove.fromJson(Map<String, dynamic> json) =>
      _$PokemonMoveFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonMoveToJson(this);
}
