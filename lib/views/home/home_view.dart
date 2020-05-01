import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/views/home/widgets/appbar_widget.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

HomeController homeController;

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    homeController = HomeController();
    homeController.fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightAppBar = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
              top: -(240 / 4.6),
              left: widthScreen - (240 / 1.6),
              child: Opacity(
                  opacity: 0.1,
                  child: Image.asset(ConstsApp.blackPokeball,
                      height: 240, width: 240))),
          Column(children: <Widget>[
            SizedBox(height: heightAppBar),
            AppbarWidget(),
            Expanded(
              child: Container(child: Observer(
                builder: (_) {
                  return homeController.pokeApi == null
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: homeController.pokeApi.pokemons.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(homeController
                                    .pokeApi.pokemons[index].name));
                          });
                },
              )),
            )
          ])
        ],
      ),
    );
  }
}