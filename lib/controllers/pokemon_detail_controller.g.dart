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

  final _$currentIndexAtom =
      Atom(name: '_PokemonDetailControllerBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.context.enforceReadPolicy(_$currentIndexAtom);
    _$currentIndexAtom.reportObserved();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.context.conditionallyRunInAction(() {
      super.currentIndex = value;
      _$currentIndexAtom.reportChanged();
    }, _$currentIndexAtom, name: '${_$currentIndexAtom.name}_set');
  }

  final _$progressAtom = Atom(name: '_PokemonDetailControllerBase.progress');

  @override
  double get progress {
    _$progressAtom.context.enforceReadPolicy(_$progressAtom);
    _$progressAtom.reportObserved();
    return super.progress;
  }

  @override
  set progress(double value) {
    _$progressAtom.context.conditionallyRunInAction(() {
      super.progress = value;
      _$progressAtom.reportChanged();
    }, _$progressAtom, name: '${_$progressAtom.name}_set');
  }

  final _$multipleAtom = Atom(name: '_PokemonDetailControllerBase.multiple');

  @override
  double get multiple {
    _$multipleAtom.context.enforceReadPolicy(_$multipleAtom);
    _$multipleAtom.reportObserved();
    return super.multiple;
  }

  @override
  set multiple(double value) {
    _$multipleAtom.context.conditionallyRunInAction(() {
      super.multiple = value;
      _$multipleAtom.reportChanged();
    }, _$multipleAtom, name: '${_$multipleAtom.name}_set');
  }

  final _$opacityAtom = Atom(name: '_PokemonDetailControllerBase.opacity');

  @override
  double get opacity {
    _$opacityAtom.context.enforceReadPolicy(_$opacityAtom);
    _$opacityAtom.reportObserved();
    return super.opacity;
  }

  @override
  set opacity(double value) {
    _$opacityAtom.context.conditionallyRunInAction(() {
      super.opacity = value;
      _$opacityAtom.reportChanged();
    }, _$opacityAtom, name: '${_$opacityAtom.name}_set');
  }

  final _$opacityTitleAtom =
      Atom(name: '_PokemonDetailControllerBase.opacityTitle');

  @override
  double get opacityTitle {
    _$opacityTitleAtom.context.enforceReadPolicy(_$opacityTitleAtom);
    _$opacityTitleAtom.reportObserved();
    return super.opacityTitle;
  }

  @override
  set opacityTitle(double value) {
    _$opacityTitleAtom.context.conditionallyRunInAction(() {
      super.opacityTitle = value;
      _$opacityTitleAtom.reportChanged();
    }, _$opacityTitleAtom, name: '${_$opacityTitleAtom.name}_set');
  }

  final _$_PokemonDetailControllerBaseActionController =
      ActionController(name: '_PokemonDetailControllerBase');

  @override
  dynamic setCurrentPokemon(Pokemon newCurrentPokemon) {
    final _$actionInfo =
        _$_PokemonDetailControllerBaseActionController.startAction();
    try {
      return super.setCurrentPokemon(newCurrentPokemon);
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
  dynamic setCurrentIndex(int newCurrentIndex) {
    final _$actionInfo =
        _$_PokemonDetailControllerBaseActionController.startAction();
    try {
      return super.setCurrentIndex(newCurrentIndex);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProgress(double newProgress) {
    final _$actionInfo =
        _$_PokemonDetailControllerBaseActionController.startAction();
    try {
      return super.setProgress(newProgress);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMultiple(double newMultiple) {
    final _$actionInfo =
        _$_PokemonDetailControllerBaseActionController.startAction();
    try {
      return super.setMultiple(newMultiple);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOpacity(double newOpacity) {
    final _$actionInfo =
        _$_PokemonDetailControllerBaseActionController.startAction();
    try {
      return super.setOpacity(newOpacity);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOpacityTitle(double newOpacityTitle) {
    final _$actionInfo =
        _$_PokemonDetailControllerBaseActionController.startAction();
    try {
      return super.setOpacityTitle(newOpacityTitle);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'currentPokemon: ${currentPokemon.toString()},currentColor: ${currentColor.toString()},currentIndex: ${currentIndex.toString()},progress: ${progress.toString()},multiple: ${multiple.toString()},opacity: ${opacity.toString()},opacityTitle: ${opacityTitle.toString()}';
    return '{$string}';
  }
}
