// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_move.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonMove _$PokemonMoveFromJson(Map<String, dynamic> json) => PokemonMove(
      name: json['name'] as String,
      accuracy: json['accuracy'] as int?,
      damageClass: json['damageClass'] as String,
      effectChance: json['effectChance'] as int?,
      description: json['description'] as String,
      type: PokemonTypeReference.fromJson(json['type'] as Map<String, dynamic>),
      target: json['target'] as String,
      power: json['power'] as int?,
      pp: json['pp'] as int,
    );

Map<String, dynamic> _$PokemonMoveToJson(PokemonMove instance) =>
    <String, dynamic>{
      'name': instance.name,
      'accuracy': instance.accuracy,
      'damageClass': instance.damageClass,
      'effectChance': instance.effectChance,
      'description': instance.description,
      'type': instance.type,
      'target': instance.target,
      'power': instance.power,
      'pp': instance.pp,
    };
