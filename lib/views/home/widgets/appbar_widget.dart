import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                child: Column(
              children: <Widget>[                
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 20, right: 6),
                        child: IconButton(
                            icon: Icon(Icons.menu), onPressed: () {}))
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Pokedex",
                            style: TextStyle(
                                fontFamily: 'Google',
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ))
                    ]),
              ],
            ));
  }
}
