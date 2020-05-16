import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/views/home_view/widgets/appbar_widget.dart';
import 'package:pokedex/views/home_view/widgets/gridview_widget.dart';

class HomeView extends StatefulWidget {
  final int index;

  const HomeView({Key key, this.index}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController homeController;

  @override
  void initState() {
    super.initState();

    homeController = GetIt.instance<HomeController>();
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
              top: heightAppBar - (240 / 3),
              left: widthScreen - (240 / 1.6),
              child: Opacity(
                  opacity: 0.1,
                  child: Image.asset(ConstsApp.blackPokeball,
                      height: 240, width: 240))),
          Column(children: <Widget>[
            SizedBox(height: heightAppBar),
            AppbarWidget(),
            GridViewWidget(),
          ])
        ],
      ),
    );
  }
}
