import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/controllers/about_controller.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';
import 'package:pokedex/views/home_view/widgets/pokemon_item.dart';
import 'package:pokedex/views/pokemon_detail_view/pokemon_detail_view.dart';

class GridViewWidget extends StatelessWidget {
  final homeController = GetIt.instance<HomeController>();
  final pokemonDetailController = GetIt.instance<PokemonDetailController>();
  final aboutController = GetIt.instance<AboutController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(child: Observer(
        builder: (_) {
          return homeController.pokeApi == null
              ? Center(child: CircularProgressIndicator())
              : AnimationLimiter(
                  child: GridView.builder(
                      itemCount: homeController.pokeApi.pokemons.length,
                      padding: EdgeInsets.all(12),
                      addAutomaticKeepAlives: true,
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        var pokemon = homeController.pokeApi.pokemons[index];

                        return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            columnCount: 2,
                            child: ScaleAnimation(
                              child: GestureDetector(
                                child: PokemonItem(
                                    index: index,
                                    name: pokemon.name,
                                    number: pokemon.num,
                                    types: pokemon.type),
                                onTap: () {
                                  pokemonDetailController.setCurrentPokemon(
                                      homeController.pokeApi.pokemons[index]);
                                  pokemonDetailController
                                      .setCurrentIndex(index);
                                  aboutController.setInfoPokemon(
                                      pokemonDetailController
                                          .currentPokemon.name);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PokemonDetailView(index: index)));
                                },
                              ),
                            ));
                      }),
                );
        },
      )),
    );
  }
}
