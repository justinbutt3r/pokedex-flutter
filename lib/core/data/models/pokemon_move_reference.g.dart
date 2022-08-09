// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_move_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonMoveReference _$PokemonMoveReferenceFromJson(
        Map<String, dynamic> json) =>
    PokemonMoveReference(
      move: PokemonMove.fromJson(json['move'] as Map<String, dynamic>),
      atLevel: json['atLevel'] as int,
    );

Map<String, dynamic> _$PokemonMoveReferenceToJson(
        PokemonMoveReference instance) =>
    <String, dynamic>{
      'move': instance.move,
      'atLevel': instance.atLevel,
    };
