import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/controllers/about_controller.dart';
import 'package:pokedex/models/pokeapiV2.dart';

class StatesAba extends StatefulWidget {
  @override
  _StatesAbaState createState() => _StatesAbaState();
}

AboutController aboutController;
List<int> _stats;

class _StatesAbaState extends State<StatesAba> {
  @override
  void initState() {
    super.initState();
    aboutController = GetIt.instance<AboutController>();
  }

  List<int> getStatsPokemon(PokeApiV2 pokeApiV2) {
    List<int> states = [];

    pokeApiV2.stats.forEach((state) {
      switch (state.stat.name) {
        case "speed":
          states.add(state.baseStat);
          break;
        case "special-defense":
          states.add(state.baseStat);
          break;
        case "special-attack":
          states.add(state.baseStat);
          break;
        case "defense":
          states.add(state.baseStat);
          break;
        case "attack":
          states.add(state.baseStat);
          break;
        case "hp":
          states.add(state.baseStat);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Row(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _builderNameState("Speed"),
                  SizedBox(height: 10),
                  _builderNameState("Sp. Def"),
                  SizedBox(height: 10),
                  _builderNameState("Sp. Atk"),
                  SizedBox(height: 10),
                  _builderNameState("Defense"),
                  SizedBox(height: 10),
                  _builderNameState("Attack"),
                  SizedBox(height: 10),
                  _builderNameState("HP"),
                  SizedBox(height: 10),
                  _builderNameState("Total")
                ],
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _builderValueState(80),
                  SizedBox(height: 10),
                  _builderValueState(80),
                  SizedBox(height: 10),
                  _builderValueState(80),
                  SizedBox(height: 10),
                  _builderValueState(80),
                  SizedBox(height: 10),
                  _builderValueState(80),
                  SizedBox(height: 10),
                  _builderValueState(80),
                  SizedBox(height: 10),
                  _builderValueState(80),
                ],
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: <Widget>[
                    _builderStatusBarState(),
                    SizedBox(height: 10),
                    _builderStatusBarState(),
                    SizedBox(height: 10),
                    _builderStatusBarState(),
                    SizedBox(height: 10),
                    _builderStatusBarState(),
                    SizedBox(height: 10),
                    _builderStatusBarState(),
                    SizedBox(height: 10),
                    _builderStatusBarState(),
                    SizedBox(height: 10),
                    _builderStatusBarState(),
                  ],
                ),
              )
            ])));
  }
}

Widget _builderNameState(String state) {
  return Text(state,
      style: TextStyle(
          color: Colors.grey[600], fontFamily: 'Google', fontSize: 16));
}

Widget _builderValueState(int baseState) {
  return Text(baseState.toString(),
      style: TextStyle(
          color: Colors.black,
          fontFamily: 'Google',
          fontSize: 16,
          fontWeight: FontWeight.bold));
}

Widget _builderStatusBarState() {
  return SizedBox(
      height: 19,
      child: Center(
          child: Container(
              height: 4,
              alignment: Alignment.centerLeft,
              decoration:
                  ShapeDecoration(shape: StadiumBorder(), color: Colors.grey),
              child: FractionallySizedBox(
                  widthFactor: 0.1,
                  heightFactor: 1.0,
                  child: Container(
                      decoration: ShapeDecoration(
                          shape: StadiumBorder(), color: Colors.red))))));
}
