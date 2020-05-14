import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';
import 'package:pokedex/views/pokemon_detail/widgets/pageview_pokemon_widget.dart';
import 'widgets/background_container_widget.dart';
import 'widgets/sliding_sheet_widget.dart';
import 'widgets/types_widget.dart';

class PokemonDetailView extends StatefulWidget {
  final int index;

  const PokemonDetailView({Key key, this.index}) : super(key: key);

  @override
  _PokemonDetailViewState createState() => _PokemonDetailViewState();
}

PokemonDetailController _pokemonDetailController;

class _PokemonDetailViewState extends State<PokemonDetailView> {
  @override
  void initState() {
    super.initState();
    _pokemonDetailController = GetIt.instance<PokemonDetailController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Observer(
            builder: (_) {
              return AppBar(
                backgroundColor: _pokemonDetailController.currentColor,
                elevation: 0.0,
                title: Opacity(
                    opacity: _pokemonDetailController.opacityTitle,
                    child: Text(_pokemonDetailController.currentPokemon.name)),
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.favorite_border), onPressed: () {})
                ],
              );
            },
          )),
      body: Stack(
        children: <Widget>[
          BackgroundContainerWidget(),
          TypesWidget(),
          SlidingSheetWidget(),
          PageViewPokemonWidget(widget.index),
        ],
      ),
    );
  }
}
