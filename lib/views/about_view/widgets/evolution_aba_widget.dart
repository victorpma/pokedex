import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';
import 'package:pokedex/entities/pokemon.dart';
import 'package:sprintf/sprintf.dart';

class EvolutionAba extends StatelessWidget {
  final PokemonDetailController _pokemonDetailController =
      GetIt.instance<PokemonDetailController>();

  Widget resizeImagePokemon(Widget imagePokemon) {
    return SizedBox(height: 80, width: 80, child: imagePokemon);
  }

  Widget renderNamePokemon(String namePokemon) {
    return Text(namePokemon,
        style: TextStyle(
            fontFamily: 'Google',
            fontSize: 16,
            fontWeight:
                namePokemon == _pokemonDetailController.currentPokemon.name
                    ? FontWeight.bold
                    : FontWeight.normal,
            color: Colors.black));
  }

  List<Widget> _getEvolutions(Pokemon currentPokemon) {
    List<Widget> widgets = [];

    if (currentPokemon.prevEvolution != null) {
      currentPokemon.prevEvolution.forEach((prevEvolution) {
        widgets.add(resizeImagePokemon(Image.network(
            sprintf(ConstsApi.urlPokeImage, [prevEvolution.num]))));
        widgets.add(renderNamePokemon(prevEvolution.name));
        widgets.add(Icon(Icons.keyboard_arrow_down, size: 30));
      });
    }

    widgets.add(resizeImagePokemon(Image.network(sprintf(ConstsApi.urlPokeImage,
        [_pokemonDetailController.currentPokemon.num]))));
    widgets
        .add(renderNamePokemon(_pokemonDetailController.currentPokemon.name));

    if (currentPokemon.nextEvolution != null) {
      currentPokemon.nextEvolution.forEach((nextEvolution) {
        widgets.add(Icon(Icons.keyboard_arrow_down, size: 30));
        widgets.add(resizeImagePokemon(Image.network(
            sprintf(ConstsApi.urlPokeImage, [nextEvolution.num]))));
        widgets.add(renderNamePokemon(nextEvolution.name));
      });
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Observer(
              builder: (context) => Column(
                children:
                    _getEvolutions(_pokemonDetailController.currentPokemon),
              ),
            )));
  }
}
