import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';

class NamePokemonWidget extends StatelessWidget {
  final pokemonDetailController = GetIt.instance<PokemonDetailController>();

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;

    return Observer(builder: (context) {
      return Positioned(
          top: (heightScreen * 0.10) -
              (pokemonDetailController.progress * (heightScreen * 0.040)),
          left: 20 + (pokemonDetailController.progress * 20),
          child: Text(pokemonDetailController.currentPokemon.name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 38 - (pokemonDetailController.progress * 14),
                  fontFamily: 'Google')));
    });
  }
}
