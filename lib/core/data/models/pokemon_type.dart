import 'package:json_annotation/json_annotation.dart';
import 'pokemon_type_reference.dart';

part 'pokemon_type.g.dart';

@JsonSerializable(
  includeIfNull: false,
)
class PokemonType {
  PokemonType({
    required this.name,
    required this.id,
    this.noDamageTo,
    this.noDamageFrom,
    this.halfDamageTo,
    this.halfDamageFrom,
    this.doubleDamageTo,
    this.doubleDamageFrom,
  });

  final String name;
  @JsonKey(name: '_id')
  final String id;
  final List<PokemonTypeReference>? noDamageTo;
  final List<PokemonTypeReference>? noDamageFrom;
  final List<PokemonTypeReference>? halfDamageTo;
  final List<PokemonTypeReference>? halfDamageFrom;
  final List<PokemonTypeReference>? doubleDamageTo;
  final List<PokemonTypeReference>? doubleDamageFrom;

  // ignore: sort_constructors_first
  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);

  // Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);

  Map<String, dynamic> toJson() {
    final result = _$PokemonTypeToJson(this);
    return result;
  }
}
