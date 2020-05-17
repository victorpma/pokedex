import 'package:mobx/mobx.dart';
import 'package:pokedex/models/specie.dart';
import 'package:pokedex/repositories/concrete/SpeciePokemonRepository.dart';
part 'about_controller.g.dart';

class AboutController = _AboutControllerBase with _$AboutController;

abstract class _AboutControllerBase with Store {
  var speciePokemonRepository = SpeciePokemonRepository();

  @observable
  Specie currentSpecie;

  @action
  setCurrentSpecie(String namePokemon) async {
    currentSpecie = null;
    currentSpecie =
        await speciePokemonRepository.getSpecie(namePokemon.toLowerCase());
  }
}
