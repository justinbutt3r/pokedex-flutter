import 'package:json_annotation/json_annotation.dart';

part 'pokemon_form_details.g.dart';

@JsonSerializable()
class PokemonFormDetails {
  PokemonFormDetails(this.name, this.image);

  final String name;
  final String image;

  // ignore: sort_constructors_first
  factory PokemonFormDetails.fromJson(Map<String, dynamic> json) =>
      _$PokemonFormDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonFormDetailsToJson(this);
}
