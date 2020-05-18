import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/models/pokeapiV2.dart';

abstract class IPokemonRepository {
  Future<PokeApi> getPokemons();
  Future<PokeApiV2> getInfoPokemon(String namePokemon);
}
