import 'package:pokedex/models/specie.dart';

abstract class ISpeciePokemonRepository {
  Future<Specie> getSpecie(String namePokemon);
}
