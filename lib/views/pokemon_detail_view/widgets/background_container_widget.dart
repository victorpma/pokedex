import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';

class BackgroundContainerWidget extends StatelessWidget {
  final _pokemonDetailController = GetIt.instance<PokemonDetailController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return AnimatedContainer(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                _pokemonDetailController.currentColor.withOpacity(0.8),
                _pokemonDetailController.currentColor
              ])),
          duration: Duration(milliseconds: 300));
    });
  }
}
