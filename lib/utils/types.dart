// normal
// fighting
// flying
// poison
// ground
// rock
// bug
// ghost
// steel
// fire
// water
// grass
// electric
// psychic
// ice
// dragon
// dark
// fairy

import 'package:flutter/material.dart';
import '../core/models/type_variables.dart';

//Colors
const Color normalColor = Color(0xFFA8A878);
const Color fightingColor = Color(0xFFC03028);
const Color flyingColor = Color(0xFFA890F0);
const Color poisonColor = Color(0xFFA040A0);
const Color groundColor = Color(0xFFE0C068);
const Color rockColor = Color(0xFFB8A038);
const Color bugColor = Color(0xFFA8B820);
const Color ghostColor = Color(0xFF705898);
const Color steelColor = Color(0xFFB8B8D0);
const Color fireColor = Color(0xFFF08030);
const Color waterColor = Color(0xFF6890F0);
const Color grassColor = Color(0xFF78C850);
const Color electricColor = Color(0xFFF8D030);
const Color psychicColor = Color(0xFFF85888);
const Color iceColor = Color(0xFF98D8D8);
const Color dragonColor = Color(0xFF7038F8);
const Color darkColor = Color(0xFF705848);
const Color fairyColor = Color(0xFFEE99AC);

// images
const String normalImage = 'assets/images/normal.svg';
const String fightingImage = 'assets/images/fighting.svg';
const String flyingImage = 'assets/images/flying.svg';
const String poisonImage = 'assets/images/poison.svg';
const String groundImage = 'assets/images/ground.svg';
const String rockImage = 'assets/images/rock.svg';
const String bugImage = 'assets/images/bug.svg';
const String ghostImage = 'assets/images/ghost.svg';
const String steelImage = 'assets/images/steel.svg';
const String fireImage = 'assets/images/fire.svg';
const String waterImage = 'assets/images/water.svg';
const String grassImage = 'assets/images/grass.svg';
const String electricImage = 'assets/images/electric.svg';
const String psychicImage = 'assets/images/psychic.svg';
const String iceImage = 'assets/images/ice.svg';
const String dragonImage = 'assets/images/dragon.svg';
const String darkImage = 'assets/images/dark.svg';
const String fairyImage = 'assets/images/fairy.svg';

List<TypeVariables> typeVariables = [
  TypeVariables(name: 'normal', image: normalImage, color: normalColor),
  TypeVariables(name: 'fighting', image: fightingImage, color: fightingColor),
  TypeVariables(name: 'flying', image: flyingImage, color: flyingColor),
  TypeVariables(name: 'poison', image: poisonImage, color: poisonColor),
  TypeVariables(name: 'ground', image: groundImage, color: groundColor),
  TypeVariables(name: 'rock', image: rockImage, color: rockColor),
  TypeVariables(name: 'bug', image: bugImage, color: bugColor),
  TypeVariables(name: 'ghost', image: ghostImage, color: ghostColor),
  TypeVariables(name: 'steel', image: steelImage, color: steelColor),
  TypeVariables(name: 'fire', image: fireImage, color: fireColor),
  TypeVariables(name: 'water', image: waterImage, color: waterColor),
  TypeVariables(name: 'grass', image: grassImage, color: grassColor),
  TypeVariables(name: 'electric', image: electricImage, color: electricColor),
  TypeVariables(name: 'psychic', image: psychicImage, color: psychicColor),
  TypeVariables(name: 'ice', image: iceImage, color: iceColor),
  TypeVariables(name: 'dragon', image: dragonImage, color: dragonColor),
  TypeVariables(name: 'dark', image: darkImage, color: darkColor),
  TypeVariables(name: 'fairy', image: fairyImage, color: fairyColor),
];

TypeVariables findByName(String name) =>
    typeVariables.firstWhere((book) => book.name == name);

Color getTypeColor(String name) {
  final TypeVariables selectedType = findByName(name);

  return selectedType.color;
}

String getTypeImage(String name) {
  final TypeVariables selectedType = findByName(name);

  return selectedType.image;
}
