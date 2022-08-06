import 'package:json_annotation/json_annotation.dart';

import 'pokemon_type_reference.dart';

part 'pokemon_summary.g.dart';

@JsonSerializable()
class PokemonSummary {
  PokemonSummary({
    required this.types,
    required this.id,
    required this.name,
    required this.apiId,
    this.image = '',
    this.pokemonId = -1,
  });

  final List<PokemonTypeReference> types;
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final int apiId;
  final int pokemonId;
  final String image;

  // ignore: sort_constructors_first
  factory PokemonSummary.fromJson(Map<String, dynamic> json) =>
      _$PokemonSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSummaryToJson(this);
}
