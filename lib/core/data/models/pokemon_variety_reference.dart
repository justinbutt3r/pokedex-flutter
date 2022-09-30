import 'package:json_annotation/json_annotation.dart';

import 'pokemon_summary.dart';

part 'pokemon_variety_reference.g.dart';

@JsonSerializable(includeIfNull: false)
class PokemonVarietyReference {
  PokemonVarietyReference({
    required this.pokemon,
    required this.detail,
  });
  @JsonKey(includeIfNull: false)
  final PokemonSummary pokemon;
  final String detail;

  // ignore: sort_constructors_first
  factory PokemonVarietyReference.fromJson(Map<String, dynamic> json) =>
      _$PokemonVarietyReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonVarietyReferenceToJson(this);
}
