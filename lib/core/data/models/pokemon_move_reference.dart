import 'package:json_annotation/json_annotation.dart';

import 'pokemon_move.dart';

part 'pokemon_move_reference.g.dart';

@JsonSerializable(includeIfNull: false)
class PokemonMoveReference {
  PokemonMoveReference({
    required this.move,
    required this.atLevel,
  });
  @JsonKey(includeIfNull: false)
  final PokemonMove move;
  final int atLevel;

  // ignore: sort_constructors_first
  factory PokemonMoveReference.fromJson(Map<String, dynamic> json) =>
      _$PokemonMoveReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonMoveReferenceToJson(this);
}
