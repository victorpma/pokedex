import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/consts/consts_app.dart';
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

  @observable
  double progress = 0;

  @observable
  double multiple = 1;

  @observable
  double opacity = 1;

  @observable
  double opacityTitle = 0;

  @action
  setCurrentPokemon(Pokemon newCurrentPokemon) {
    currentPokemon = newCurrentPokemon;
    setCurrentColor(ConstsApp.getColorType(type: currentPokemon.type[0]));
  }

  @action
  setCurrentColor(Color newCurrentColor) => currentColor = newCurrentColor;

  @action
  setCurrentIndex(int newCurrentIndex) => currentIndex = newCurrentIndex;

  @action
  setProgress(double newProgress) => progress = newProgress;

  @action
  setMultiple(double newMultiple) => multiple = newMultiple;

  @action
  setOpacity(double newOpacity) => opacity = newOpacity;

  @action
  setOpacityTitle(double newOpacityTitle) => opacityTitle = newOpacityTitle;

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }
}
