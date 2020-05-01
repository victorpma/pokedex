import 'package:pokedex/models/pokeapi.dart';

abstract class IPokemonRepository {
  Future<PokeApi> getPokemons();
}
