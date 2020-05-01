import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/repositories/abstract/IPokemonRepository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonRepository implements IPokemonRepository {
  @override
  Future<PokeApi> getPokemons() async {
    try {
      final response = await http.get(ConstsApi.urlPokeAPI);

      var decodeJson = json.decode(response.body);

      return PokeApi.fromJson(decodeJson);
    } catch (ex) {
      print('Error get pokemons');
      return null;
    }
  }
}
