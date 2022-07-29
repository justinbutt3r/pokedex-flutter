// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => PokemonAbility.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      apiName: json['apiName'] as String,
      apiId: json['apiId'] as int,
      pokemonId: json['pokemonId'] as int? ?? -1,
      image: json['image'] as String? ?? '',
      description: json['description'] as String,
      weight: json['weight'] as int,
      height: json['height'] as int,
      hp: json['hp'] as int,
      atk: json['atk'] as int,
      def: json['def'] as int,
      satk: json['satk'] as int,
      sdef: json['sdef'] as int,
      spd: json['spd'] as int,
      species: json['species'] as String,
      gender: json['gender'] as int,
      hasGenderDifferences: json['hasGenderDifferences'] as bool,
      isLegendary: json['isLegendary'] as bool,
      isMythical: json['isMythical'] as bool,
      isDefault: json['isDefault'] as bool,
      generation: json['generation'] as int,
      evolutionItem: json['evolutionItem'] == null
          ? null
          : PokemonEvolutionItem.fromJson(
              json['evolutionItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'types': instance.types,
      'abilities': instance.abilities,
      'name': instance.name,
      'apiName': instance.apiName,
      'apiId': instance.apiId,
      'pokemonId': instance.pokemonId,
      'image': instance.image,
      'description': instance.description,
      'weight': instance.weight,
      'height': instance.height,
      'hp': instance.hp,
      'atk': instance.atk,
      'def': instance.def,
      'satk': instance.satk,
      'sdef': instance.sdef,
      'spd': instance.spd,
      'species': instance.species,
      'gender': instance.gender,
      'hasGenderDifferences': instance.hasGenderDifferences,
      'isLegendary': instance.isLegendary,
      'isMythical': instance.isMythical,
      'isDefault': instance.isDefault,
      'generation': instance.generation,
      'evolutionItem': instance.evolutionItem,
    };
