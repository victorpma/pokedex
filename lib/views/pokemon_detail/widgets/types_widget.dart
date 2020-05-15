import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';

class TypesWidget extends StatelessWidget {
  final List<String> types;

  const TypesWidget({Key key, this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    final pokemonDetailController = GetIt.instance<PokemonDetailController>();
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    types.forEach((type) {
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
        top: heightScreen * 0.18,
        left: 20,
        right: 20,
        child: Observer(
          builder: (context) => Container(
              width: widthScreen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(children: widgets),
                  Text('#' + pokemonDetailController.currentPokemon.num,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: 'Google'))
                ],
              )),
        ));
  }
}
