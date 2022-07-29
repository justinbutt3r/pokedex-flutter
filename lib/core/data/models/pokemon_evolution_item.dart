import 'package:json_annotation/json_annotation.dart';
import 'pokemon_summary.dart';

part 'pokemon_evolution_item.g.dart';

@JsonSerializable()
class PokemonEvolutionItem {
  PokemonEvolutionItem({
    required this.apiId,
    required this.apiName,
    required this.isBaby,
    this.atLevel,
    this.usingItem,
    this.tradeEvolution,
    this.whileHolding,
    this.otherDetail,
    required this.pokemon,
    required this.evolvesInto,
  });

  final int apiId;
  final String apiName;
  final bool isBaby;
  final String? atLevel;
  final String? usingItem;
  final bool? tradeEvolution;
  final String? whileHolding;
  final String? otherDetail;
  final PokemonSummary pokemon;
  final List<PokemonEvolutionItem> evolvesInto;

  //evolvesinto

  // ignore: sort_constructors_first
  factory PokemonEvolutionItem.fromJson(Map<String, dynamic> json) =>
      _$PokemonEvolutionItemFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonEvolutionItemToJson(this);
}
