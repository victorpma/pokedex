// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonDetailController on _PokemonDetailControllerBase, Store {
  final _$currentPokemonAtom =
      Atom(name: '_PokemonDetailControllerBase.currentPokemon');

  @override
  Pokemon get currentPokemon {
    _$currentPokemonAtom.context.enforceReadPolicy(_$currentPokemonAtom);
    _$currentPokemonAtom.reportObserved();
    return super.currentPokemon;
  }

  @override
  set currentPokemon(Pokemon value) {
    _$currentPokemonAtom.context.conditionallyRunInAction(() {
      super.currentPokemon = value;
      _$currentPokemonAtom.reportChanged();
    }, _$currentPokemonAtom, name: '${_$currentPokemonAtom.name}_set');
  }

  final _$currentColorAtom =
      Atom(name: '_PokemonDetailControllerBase.currentColor');

  @override
  Color get currentColor {
    _$currentColorAtom.context.enforceReadPolicy(_$currentColorAtom);
    _$currentColorAtom.reportObserved();
    return super.currentColor;
  }

  @override
  set currentColor(Color value) {
    _$currentColorAtom.context.conditionallyRunInAction(() {
      super.currentColor = value;
      _$currentColorAtom.reportChanged();
    }, _$currentColorAtom, name: '${_$currentColorAtom.name}_set');
  }

  final _$_PokemonDetailControllerBaseActionController =
      ActionController(name: '_PokemonDetailControllerBase');

  @override
  dynamic setCurrentPokemon(Pokemon newPokemon) {
    final _$actionInfo =
        _$_PokemonDetailControllerBaseActionController.startAction();
    try {
      return super.setCurrentPokemon(newPokemon);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentColor(Color newCurrentColor) {
    final _$actionInfo =
        _$_PokemonDetailControllerBaseActionController.startAction();
    try {
      return super.setCurrentColor(newCurrentColor);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'currentPokemon: ${currentPokemon.toString()},currentColor: ${currentColor.toString()}';
    return '{$string}';
  }
}
