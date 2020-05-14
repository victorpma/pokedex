import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';

class TypesWidget extends StatelessWidget {
  final pokemonDetailController = GetIt.instance<PokemonDetailController>();

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    final widthScreen = MediaQuery.of(context).size.width;

    pokemonDetailController.currentPokemon.type.forEach((type) {
      widgets.add(Padding(
          padding: EdgeInsets.only(right: 10),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(80, 255, 255, 255),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  type,
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          )));
    });

    return Positioned(
        top: 10,
        left: 20,
        right: 20,
        child: Observer(
          builder: (context) => Container(
              width: widthScreen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(pokemonDetailController.currentPokemon.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                              fontFamily: 'Google')),
                      Text('#' + pokemonDetailController.currentPokemon.num,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              fontFamily: 'Google'))
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(children: widgets)
                ],
              )),
        ));
  }
}
