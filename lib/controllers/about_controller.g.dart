// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AboutController on _AboutControllerBase, Store {
  final _$currentSpecieAtom = Atom(name: '_AboutControllerBase.currentSpecie');

  @override
  Specie get currentSpecie {
    _$currentSpecieAtom.context.enforceReadPolicy(_$currentSpecieAtom);
    _$currentSpecieAtom.reportObserved();
    return super.currentSpecie;
  }

  @override
  set currentSpecie(Specie value) {
    _$currentSpecieAtom.context.conditionallyRunInAction(() {
      super.currentSpecie = value;
      _$currentSpecieAtom.reportChanged();
    }, _$currentSpecieAtom, name: '${_$currentSpecieAtom.name}_set');
  }

  final _$pokeApiV2Atom = Atom(name: '_AboutControllerBase.pokeApiV2');

  @override
  PokeApiV2 get pokeApiV2 {
    _$pokeApiV2Atom.context.enforceReadPolicy(_$pokeApiV2Atom);
    _$pokeApiV2Atom.reportObserved();
    return super.pokeApiV2;
  }

  @override
  set pokeApiV2(PokeApiV2 value) {
    _$pokeApiV2Atom.context.conditionallyRunInAction(() {
      super.pokeApiV2 = value;
      _$pokeApiV2Atom.reportChanged();
    }, _$pokeApiV2Atom, name: '${_$pokeApiV2Atom.name}_set');
  }

  final _$setCurrentSpecieAsyncAction = AsyncAction('setCurrentSpecie');

  @override
  Future setCurrentSpecie(String namePokemon) {
    return _$setCurrentSpecieAsyncAction
        .run(() => super.setCurrentSpecie(namePokemon));
  }

  final _$setInfoPokemonAsyncAction = AsyncAction('setInfoPokemon');

  @override
  Future setInfoPokemon(String namePokemon) {
    return _$setInfoPokemonAsyncAction
        .run(() => super.setInfoPokemon(namePokemon));
  }

  @override
  String toString() {
    final string =
        'currentSpecie: ${currentSpecie.toString()},pokeApiV2: ${pokeApiV2.toString()}';
    return '{$string}';
  }
}
