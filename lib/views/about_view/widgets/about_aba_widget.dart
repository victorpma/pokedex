import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/controllers/about_controller.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';

class AboutAba extends StatelessWidget {
  final PokemonDetailController _pokemonDetailController =
      GetIt.instance<PokemonDetailController>();
  final AboutController _aboutController = GetIt.instance<AboutController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Description",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Google',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10),
                Observer(
                  builder: (context) => _aboutController.currentSpecie == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                height: 20,
                                width: 20,
                                child: Center(
                                    child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                      _pokemonDetailController.currentColor),
                                ))),
                          ],
                        )
                      : Text(
                          _aboutController.currentSpecie.flavorTextEntries
                              .where((element) => element.language.name == 'en')
                              .first
                              .flavorText
                              .trim(),
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Google',
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                ),
                SizedBox(height: 20),
                Text(
                  "Biology",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Google',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 1.0),
                            blurRadius: 3.0)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Height",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Google',
                                  fontSize: 16)),
                          SizedBox(height: 10),
                          Observer(
                            builder: (context) => Text(
                                _pokemonDetailController.currentPokemon.height,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Google',
                                    fontSize: 16),
                                textAlign: TextAlign.center),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Width",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Google',
                                  fontSize: 16)),
                          SizedBox(height: 10),
                          Observer(
                            builder: (context) => Text(
                                _pokemonDetailController.currentPokemon.weight,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Google',
                                    fontSize: 16),
                                textAlign: TextAlign.center),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
