// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSummary _$PokemonSummaryFromJson(Map<String, dynamic> json) =>
    PokemonSummary(
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonTypeReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['_id'] as String,
      name: json['name'] as String,
      apiId: json['apiId'] as int,
      image: json['image'] as String? ?? '',
      pokemonId: json['pokemonId'] as int? ?? -1,
      formName: json['formName'] as String? ?? '',
      hp: json['hp'] as int? ?? 0,
      atk: json['atk'] as int? ?? 0,
      def: json['def'] as int? ?? 0,
      satk: json['satk'] as int? ?? 0,
      sdef: json['sdef'] as int? ?? 0,
      spd: json['spd'] as int? ?? 0,
    );

Map<String, dynamic> _$PokemonSummaryToJson(PokemonSummary instance) =>
    <String, dynamic>{
      'types': instance.types,
      '_id': instance.id,
      'name': instance.name,
      'apiId': instance.apiId,
      'pokemonId': instance.pokemonId,
      'image': instance.image,
      'formName': instance.formName,
      'hp': instance.hp,
      'atk': instance.atk,
      'def': instance.def,
      'satk': instance.satk,
      'sdef': instance.sdef,
      'spd': instance.spd,
    };
