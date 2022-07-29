// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) => PokemonType(
      name: json['name'] as String,
      id: json['_id'] as String,
      noDamageTo: (json['noDamageTo'] as List<dynamic>?)
          ?.map((e) => PokemonTypeReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      noDamageFrom: (json['noDamageFrom'] as List<dynamic>?)
          ?.map((e) => PokemonTypeReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      halfDamageTo: (json['halfDamageTo'] as List<dynamic>?)
          ?.map((e) => PokemonTypeReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      halfDamageFrom: (json['halfDamageFrom'] as List<dynamic>?)
          ?.map((e) => PokemonTypeReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      doubleDamageTo: (json['doubleDamageTo'] as List<dynamic>?)
          ?.map((e) => PokemonTypeReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      doubleDamageFrom: (json['doubleDamageFrom'] as List<dynamic>?)
          ?.map((e) => PokemonTypeReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    '_id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('noDamageTo', instance.noDamageTo);
  writeNotNull('noDamageFrom', instance.noDamageFrom);
  writeNotNull('halfDamageTo', instance.halfDamageTo);
  writeNotNull('halfDamageFrom', instance.halfDamageFrom);
  writeNotNull('doubleDamageTo', instance.doubleDamageTo);
  writeNotNull('doubleDamageFrom', instance.doubleDamageFrom);
  return val;
}
