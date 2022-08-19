import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import '../../services/cache_options.dart';
import '../models/pokemon_ability.dart';
import '../models/pokemon_item.dart';
import '../models/pokemon_move.dart';
import '../models/pokemon_summary.dart';
import '../models/result_errors.dart';

class PokemonService {
  PokemonService({
    // this.baseUrl = 'https://justinbutt3r-butterapi.herokuapp.com/pokedex',
    this.baseUrl = 'http://localhost:3001/pokedex',
  });

  final String baseUrl;

  final Dio dio = Dio()
    ..interceptors.add(DioCacheInterceptor(options: options));

  String getUrl({
    required String url,
    Map<String, String>? extraParameters,
  }) {
    final Map<String, String> queryParameters = {};

    if (extraParameters != null) {
      queryParameters.addAll(extraParameters);
    }

    return Uri.parse('$baseUrl/$url')
        .replace(
          queryParameters: queryParameters,
        )
        .toString();
  }

  Future<Pokemon> getPokemon(int id) async {
    try {
      final response = await dio.get(
        getUrl(
          url: 'getPokemon',
          extraParameters: {
            'id': id.toString(),
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 304) {
        // ignore: argument_type_not_assignable
        return Pokemon.fromJson(response.data);
      } else {
        throw ErrorGettingPokemon('Error getting pokemon');
      }
    } catch (e) {
      inspect(e);
      if (e is DioError) {
        throw ErrorGettingPokemon('Error fetching data');
      } else {
        throw ErrorGettingPokemon(e.toString());
      }
    }
  }

  Future<List<PokemonSummary>> getPokemonByGeneration(int generation) async {
    try {
      final response = await dio.get(
        getUrl(
          url: 'getAllFromGen',
          extraParameters: {
            'generation': generation.toString(),
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 304) {
        final List list = response.data as List;
        final List<PokemonSummary> pokemonlist =
            // ignore: argument_type_not_assignable
            list.map((e) => PokemonSummary.fromJson(e)).toList();
        return pokemonlist;
      } else {
        throw ErrorGettingPokemon('Error getting pokemon');
      }
    } catch (e) {
      inspect(e);
      if (e is DioError) {
        throw ErrorGettingPokemon('Error fetching data');
      } else {
        throw ErrorGettingPokemon(e.toString());
      }
    }
  }

  Future<List<PokemonSummary>> getPokemonByType(String type) async {
    try {
      final response = await dio.get(
        getUrl(
          url: 'getAllByType',
          extraParameters: {
            'type': type,
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 304) {
        final List list = response.data as List;
        final List<PokemonSummary> pokemonlist =
            // ignore: argument_type_not_assignable
            list.map((e) => PokemonSummary.fromJson(e)).toList();
        return pokemonlist;
      } else {
        throw ErrorGettingPokemon('Error getting pokemon');
      }
    } catch (e) {
      inspect(e);
      if (e is DioError) {
        throw ErrorGettingPokemon('Error fetching data');
      } else {
        throw ErrorGettingPokemon(e.toString());
      }
    }
  }

  Future<List<PokemonSummary>> getPokemonByFlag(
      {bool? isMythical, bool? isLegendary}) async {
    try {
      final response = await dio.get(
        getUrl(
          url: 'getAllFlag',
          extraParameters: {
            'isMythical': isMythical != null && isMythical ? '1' : '0',
            'isLegendary': isLegendary != null && isLegendary ? '1' : '0',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 304) {
        final List list = response.data as List;
        final List<PokemonSummary> pokemonlist =
            // ignore: argument_type_not_assignable
            list.map((e) => PokemonSummary.fromJson(e)).toList();
        return pokemonlist;
      } else {
        throw ErrorGettingPokemon('Error getting pokemon');
      }
    } catch (e) {
      inspect(e);
      if (e is DioError) {
        throw ErrorGettingPokemon('Error fetching data');
      } else {
        throw ErrorGettingPokemon(e.toString());
      }
    }
  }

  Future<List<PokemonMove>> getMoves() async {
    try {
      final response = await dio.get(getUrl(
        url: 'getMoves',
      ));
      if (response.statusCode == 200 || response.statusCode == 304) {
        final List list = response.data as List;
        final List<PokemonMove> moves =
            // ignore: argument_type_not_assignable
            list.map((e) => PokemonMove.fromJson(e)).toList();
        return moves;
      } else {
        throw ErrorGettingPokemon('Error getting moves');
      }
    } catch (e) {
      if (e is DioError) {
        throw ErrorGettingPokemon('Error fetching data');
      } else {
        throw ErrorGettingPokemon(e.toString());
      }
    }
  }

  Future<List<PokemonMove>> getMovesByType(String type) async {
    try {
      final response = await dio.get(getUrl(
        url: 'getMovesByType',
        extraParameters: {
          'type': type,
        },
      ));
      if (response.statusCode == 200 || response.statusCode == 304) {
        final List list = response.data as List;
        final List<PokemonMove> moves =
            // ignore: argument_type_not_assignable
            list.map((e) => PokemonMove.fromJson(e)).toList();
        return moves;
      } else {
        throw ErrorGettingPokemon('Error getting moves');
      }
    } catch (e) {
      if (e is DioError) {
        throw ErrorGettingPokemon('Error fetching data');
      } else {
        throw ErrorGettingPokemon(e.toString());
      }
    }
  }

  Future<List<PokemonMove>> getMovesByDamageClass(String damageClass) async {
    try {
      final response = await dio.get(getUrl(
        url: 'getMovesByClass',
        extraParameters: {
          'class': damageClass,
        },
      ));
      if (response.statusCode == 200 || response.statusCode == 304) {
        final List list = response.data as List;
        final List<PokemonMove> moves =
            // ignore: argument_type_not_assignable
            list.map((e) => PokemonMove.fromJson(e)).toList();
        return moves;
      } else {
        throw ErrorGettingPokemon('Error getting moves');
      }
    } catch (e) {
      if (e is DioError) {
        throw ErrorGettingPokemon('Error fetching data');
      } else {
        throw ErrorGettingPokemon(e.toString());
      }
    }
  }

  Future<List<PokemonMove>> getMovesWithEffect() async {
    try {
      final response = await dio.get(getUrl(
        url: 'getMovesWithEffect',
      ));
      if (response.statusCode == 200 || response.statusCode == 304) {
        final List list = response.data as List;
        final List<PokemonMove> moves =
            // ignore: argument_type_not_assignable
            list.map((e) => PokemonMove.fromJson(e)).toList();
        return moves;
      } else {
        throw ErrorGettingPokemon('Error getting moves');
      }
    } catch (e) {
      if (e is DioError) {
        throw ErrorGettingPokemon('Error fetching data');
      } else {
        throw ErrorGettingPokemon(e.toString());
      }
    }
  }

  Future<List<PokemonAbility>> getAbilities() async {
    try {
      final response = await dio.get(getUrl(url: 'getAbilities'));
      if (response.statusCode == 200 || response.statusCode == 304) {
        final List list = response.data as List;
        final List<PokemonAbility> abilities =
            // ignore: argument_type_not_assignable
            list.map((e) => PokemonAbility.fromJson(e)).toList();
        return abilities;
      } else {
        throw ErrorGettingPokemon('Error getting ability');
      }
    } catch (e) {
      if (e is DioError) {
        throw ErrorGettingPokemon('Error fetching data');
      } else {
        throw ErrorGettingPokemon(e.toString());
      }
    }
  }
}
