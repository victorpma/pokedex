import 'dart:convert';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/specie.dart';
import 'package:pokedex/repositories/abstract/ISpeciePokemonRepository.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

class SpeciePokemonRepository implements ISpeciePokemonRepository {
  @override
  Future<Specie> getSpecie(String namePokemon) async {
    try {
      final response =
          await http.get(sprintf(ConstsApi.urlPokeSpecie, [namePokemon]));

      var decodeJson = json.decode(response.body);

      return Specie.fromJson(decodeJson);
    } catch (ex) {
      print('Error get specie');
      return null;
    }
  }
}
