import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';
import 'views/home_view/home_view.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<HomeController>(HomeController(), signalsReady: true);
  getIt.registerSingleton<PokemonDetailController>(PokemonDetailController(),
      signalsReady: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
