class MoveListPageArguments {
  MoveListPageArguments(
      {this.damageClass, this.effectChance = false, this.type});

  final String? type;
  final String? damageClass;
  final bool effectChance;
}
