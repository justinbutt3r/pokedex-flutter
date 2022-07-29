// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonAbility _$PokemonAbilityFromJson(Map<String, dynamic> json) =>
    PokemonAbility(
      name: json['name'] as String,
      apiName: json['apiName'] as String,
      apiId: json['apiId'] as int,
      description: json['description'] as String,
      flavour: json['flavour'] as String? ?? '',
    );

Map<String, dynamic> _$PokemonAbilityToJson(PokemonAbility instance) =>
    <String, dynamic>{
      'name': instance.name,
      'apiName': instance.apiName,
      'apiId': instance.apiId,
      'description': instance.description,
      'flavour': instance.flavour,
    };
