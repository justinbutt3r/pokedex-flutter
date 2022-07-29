// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_evolution_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonEvolutionItem _$PokemonEvolutionItemFromJson(
        Map<String, dynamic> json) =>
    PokemonEvolutionItem(
      apiId: json['apiId'] as int,
      apiName: json['apiName'] as String,
      isBaby: json['isBaby'] as bool,
      atLevel: json['atLevel'] as String?,
      usingItem: json['usingItem'] as String?,
      tradeEvolution: json['tradeEvolution'] as bool?,
      whileHolding: json['whileHolding'] as String?,
      otherDetail: json['otherDetail'] as String?,
      pokemon: PokemonSummary.fromJson(json['pokemon'] as Map<String, dynamic>),
      evolvesInto: (json['evolvesInto'] as List<dynamic>)
          .map((e) => PokemonEvolutionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonEvolutionItemToJson(
        PokemonEvolutionItem instance) =>
    <String, dynamic>{
      'apiId': instance.apiId,
      'apiName': instance.apiName,
      'isBaby': instance.isBaby,
      'atLevel': instance.atLevel,
      'usingItem': instance.usingItem,
      'tradeEvolution': instance.tradeEvolution,
      'whileHolding': instance.whileHolding,
      'otherDetail': instance.otherDetail,
      'pokemon': instance.pokemon,
      'evolvesInto': instance.evolvesInto,
    };
