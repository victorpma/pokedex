import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/controllers/about_controller.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';
import 'package:pokedex/models/pokeapiV2.dart';

class StatesAba extends StatefulWidget {
  @override
  _StatesAbaState createState() => _StatesAbaState();
}

AboutController _aboutController;
PokemonDetailController _pokemonDetailController;
List<int> _stats;

class _StatesAbaState extends State<StatesAba> {
  @override
  void initState() {
    super.initState();
    _aboutController = GetIt.instance<AboutController>();
    _pokemonDetailController = GetIt.instance<PokemonDetailController>();
    _stats = [];
  }

  _getStatsPokemon(PokeApiV2 pokeApiV2) {
    int sum = 0;
    _stats = [];

    if (pokeApiV2 != null) {
      pokeApiV2.stats.forEach((state) {
        sum += state.baseStat;

        switch (state.stat.name) {
          case "speed":
            _stats.add(state.baseStat);
            break;
          case "special-defense":
            _stats.add(state.baseStat);
            break;
          case "special-attack":
            _stats.add(state.baseStat);
            break;
          case "defense":
            _stats.add(state.baseStat);
            break;
          case "attack":
            _stats.add(state.baseStat);
            break;
          case "hp":
            _stats.add(state.baseStat);
            break;
        }
      });

      _stats.add(sum);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Observer(builder: (context) {
              _getStatsPokemon(_aboutController.pokeApiV2);
              return _aboutController.pokeApiV2 == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                            height: 20,
                            width: 20,
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                    _pokemonDetailController.currentColor),
                              ),
                            )),
                      ],
                    )
                  : Row(children: <Widget>[
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
                          _builderValueState(_stats[0]),
                          SizedBox(height: 10),
                          _builderValueState(_stats[1]),
                          SizedBox(height: 10),
                          _builderValueState(_stats[2]),
                          SizedBox(height: 10),
                          _builderValueState(_stats[3]),
                          SizedBox(height: 10),
                          _builderValueState(_stats[4]),
                          SizedBox(height: 10),
                          _builderValueState(_stats[5]),
                          SizedBox(height: 10),
                          _builderValueState(_stats[6]),
                        ],
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            _builderStatusBarState(_stats[0] / 160),
                            SizedBox(height: 10),
                            _builderStatusBarState(_stats[1] / 160),
                            SizedBox(height: 10),
                            _builderStatusBarState(_stats[2] / 160),
                            SizedBox(height: 10),
                            _builderStatusBarState(_stats[3] / 160),
                            SizedBox(height: 10),
                            _builderStatusBarState(_stats[4] / 160),
                            SizedBox(height: 10),
                            _builderStatusBarState(_stats[5] / 160),
                            SizedBox(height: 10),
                            _builderStatusBarState(_stats[6] / 680),
                          ],
                        ),
                      )
                    ]);
            })));
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

Widget _builderStatusBarState(double baseState) {
  return SizedBox(
      height: 19,
      child: Center(
          child: Container(
              height: 4,
              alignment: Alignment.centerLeft,
              decoration:
                  ShapeDecoration(shape: StadiumBorder(), color: Colors.grey),
              child: FractionallySizedBox(
                  widthFactor: baseState,
                  heightFactor: 1.0,
                  child: Observer(
                    builder: (context) => Container(
                        decoration: ShapeDecoration(
                            shape: StadiumBorder(),
                            color: baseState > 0.5 ? Colors.teal : Colors.red)),
                  )))));
}
