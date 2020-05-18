import 'package:mobx/mobx.dart';
import 'package:pokedex/models/pokeapiV2.dart';
import 'package:pokedex/models/specie.dart';
import 'package:pokedex/repositories/concrete/PokemonRepository.dart';
import 'package:pokedex/repositories/concrete/SpeciePokemonRepository.dart';
part 'about_controller.g.dart';

class AboutController = _AboutControllerBase with _$AboutController;

abstract class _AboutControllerBase with Store {
  var speciePokemonRepository = SpeciePokemonRepository();
  var pokemonRepository = PokemonRepository();

  @observable
  Specie currentSpecie;

  @observable
  PokeApiV2 pokeApiV2;

  @action
  setCurrentSpecie(String namePokemon) async {
    currentSpecie = null;
    currentSpecie =
        await speciePokemonRepository.getSpecie(namePokemon.toLowerCase());
  }

  @action
  setInfoPokemon(String namePokemon) async {
    pokeApiV2 = await pokemonRepository.getInfoPokemon(namePokemon);
  }
}
