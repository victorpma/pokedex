import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/entities/pokemon.dart';
part 'pokemon_detail_controller.g.dart';

class PokemonDetailController = _PokemonDetailControllerBase
    with _$PokemonDetailController;

abstract class _PokemonDetailControllerBase with Store {
  @observable
  Pokemon currentPokemon = Pokemon();

  @observable
  Color currentColor = Colors.transparent;

  @observable
  int currentIndex;

  @action
  setCurrentPokemon(Pokemon newCurrentPokemon) =>
      currentPokemon = newCurrentPokemon;

  @action
  setCurrentColor(Color newCurrentColor) => currentColor = newCurrentColor;

  @action
  setCurrentIndex(int newCurrentIndex) => currentIndex = newCurrentIndex;
}
