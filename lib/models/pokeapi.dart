import 'package:pokedex/entities/pokemon.dart';

class PokeApi {
  List<Pokemon> pokemons;

  PokeApi.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemons = new List<Pokemon>();
      json['pokemon']
          .forEach((pokemon) => pokemons.add(new Pokemon.fromJson(pokemon)));
    }
  }

  Map<String, dynamic> toJson() {
    var json = Map<String, dynamic>();

    if (pokemons != null) {
      json['pokemon'] = pokemons.map((pokemon) => pokemon.toJson()).toList();
    }

    return json;
  }
}
