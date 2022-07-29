import 'package:json_annotation/json_annotation.dart';

part 'pokemon_type_reference.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class PokemonTypeReference {
  PokemonTypeReference({required this.name, required this.id});

  final String name;
  @JsonKey(name: '_id')
  final String id;

  // ignore: sort_constructors_first
  factory PokemonTypeReference.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeReferenceToJson(this);

  @override
  String toString() {
    return 'name: $name';
  }
}
