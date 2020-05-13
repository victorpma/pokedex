import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:sprintf/sprintf.dart';

class PokemonItem extends StatelessWidget {
  final int index;
  final String name;
  final String number;
  final List<String> types;

  const PokemonItem({Key key, this.index, this.name, this.number, this.types})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            color: ConstsApp.getColorType(type: types[0]),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Stack(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Hero(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Opacity(
                      opacity: 0.1,
                      child: Image.asset(
                        ConstsApp.whitePokeball,
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),
                  tag: 'pokeball' + index.toString(),
                )),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Hero(
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: _getImagePokemon(number)),
                tag: name,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Text(name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Google',
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: _buildTypes(types),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _getImagePokemon(String num) => CachedNetworkImage(
      alignment: Alignment.bottomRight,
      height: 80,
      width: 80,
      placeholder: (context, url) => new Container(color: Colors.transparent),
      imageUrl: sprintf(ConstsApi.urlPokeImage, [num]));

  Widget _buildTypes(List<String> types) {
    List<Widget> widgets = [];

    types.forEach((type) {
      widgets.add(Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(80, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    type,
                    style: TextStyle(
                        fontFamily: 'Google',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))),
          SizedBox(height: 4)
        ],
      ));
    });

    return Column(children: widgets);
  }
}
