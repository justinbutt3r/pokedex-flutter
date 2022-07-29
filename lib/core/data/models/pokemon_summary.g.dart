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
    );

Map<String, dynamic> _$PokemonSummaryToJson(PokemonSummary instance) =>
    <String, dynamic>{
      'types': instance.types,
      '_id': instance.id,
      'name': instance.name,
      'apiId': instance.apiId,
      'image': instance.image,
    };
