import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import '../../services/cache_options.dart';
import '../models/pokemon_item.dart';
import '../models/result_errors.dart';

class PokemonService {
  PokemonService({
    this.baseUrl = 'https://justinbutt3r-butterapi.herokuapp.com/pokedex',
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
      if (e is DioError) {
        throw ErrorGettingPokemon('Error fetching data');
      } else {
        throw ErrorGettingPokemon(e.toString());
      }
    }
  }

  Future<List<Pokemon>> getPokemonByGeneration(int generation) async {
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
        final List<Pokemon> pokemonlist =
            // ignore: argument_type_not_assignable
            list.map((e) => Pokemon.fromJson(e)).toList();
        return pokemonlist;
      } else {
        throw ErrorGettingPokemon('Error getting pokemon');
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
