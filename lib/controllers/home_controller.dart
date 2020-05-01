import 'package:mobx/mobx.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/repositories/concrete/PokemonRepository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  var pokemonRepository = PokemonRepository();

  @observable
  PokeApi pokeApi;

  @action
  fetchPokemons() async {
    pokemonRepository.getPokemons().then((pokemons) => pokeApi = pokemons);
  }
}
