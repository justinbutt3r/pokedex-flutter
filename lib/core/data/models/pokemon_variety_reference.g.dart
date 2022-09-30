// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_variety_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonVarietyReference _$PokemonVarietyReferenceFromJson(
        Map<String, dynamic> json) =>
    PokemonVarietyReference(
      pokemon: PokemonSummary.fromJson(json['pokemon'] as Map<String, dynamic>),
      detail: json['detail'] as String,
    );

Map<String, dynamic> _$PokemonVarietyReferenceToJson(
        PokemonVarietyReference instance) =>
    <String, dynamic>{
      'pokemon': instance.pokemon,
      'detail': instance.detail,
    };
