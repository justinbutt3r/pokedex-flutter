import 'package:json_annotation/json_annotation.dart';

import 'pokemon_move.dart';

part 'pokemon_move_reference.g.dart';

@JsonSerializable()
class PokemonMoveReference {
  PokemonMoveReference({
    required this.move,
    required this.atLevel,
  });
  final PokemonMove move;
  final int atLevel;

  // ignore: sort_constructors_first
  factory PokemonMoveReference.fromJson(Map<String, dynamic> json) =>
      _$PokemonMoveReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonMoveReferenceToJson(this);
}
