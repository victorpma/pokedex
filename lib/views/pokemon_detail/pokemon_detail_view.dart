import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';
import 'package:pokedex/views/pokemon_detail/widgets/pageview_pokemon_widget.dart';
import 'widgets/background_container_widget.dart';
import 'widgets/name_pokemon_widget.dart';
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
      body: Stack(
        children: <Widget>[
          BackgroundContainerWidget(),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            child: Observer(
                builder: (context) => Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Navigator.pop(context)),
                        IconButton(
                            icon: Icon(Icons.favorite_border,
                                color: Colors.white),
                            onPressed: () => Navigator.pop(context))
                      ],
                    ))),
          ),
          Observer(
              builder: (context) => TypesWidget(
                  types: _pokemonDetailController.currentPokemon.type)),
          NamePokemonWidget(),
          SlidingSheetWidget(),
          PageViewPokemonWidget(widget.index),
        ],
      ),
    );
  }
}
