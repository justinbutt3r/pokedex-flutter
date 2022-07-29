class ErrorGettingPokemon implements Exception {
  ErrorGettingPokemon(this.error);
  final String error;
}

class ErrorEmptyResponse implements Exception {}
