import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';

class BackgroundContainerWidget extends StatelessWidget {
  PokemonDetailController _pokemonDetailController =
      GetIt.instance<PokemonDetailController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return AnimatedContainer(
          color: _pokemonDetailController.currentColor,
          duration: Duration(milliseconds: 300));
    });
  }
}
