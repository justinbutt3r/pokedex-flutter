import 'package:json_annotation/json_annotation.dart';

part 'pokemon_ability.g.dart';

@JsonSerializable()
class PokemonAbility {
  PokemonAbility({
    required this.name,
    required this.apiName,
    required this.apiId,
    required this.description,
    this.flavour = '',
  });

  final String name;
  final String apiName;
  final int apiId;
  final String description;
  final String flavour;

  // ignore: sort_constructors_first
  factory PokemonAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilityToJson(this);
}
