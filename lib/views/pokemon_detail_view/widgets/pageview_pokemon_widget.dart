import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/controllers/about_controller.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:sprintf/sprintf.dart';

class PageViewPokemonWidget extends StatelessWidget {
  final int initialPage;

  PageViewPokemonWidget(this.initialPage);
  final homeController = GetIt.instance<HomeController>();
  final _pokemonDetailController = GetIt.instance<PokemonDetailController>();
  final _aboutController = GetIt.instance<AboutController>();

  @override
  Widget build(BuildContext context) {
    final pageController =
        PageController(initialPage: initialPage, viewportFraction: 0.4);
    final animationRotation = MultiTween<DefaultAnimationProperties>()
      ..add(DefaultAnimationProperties.rotation, Tween(begin: 0.0, end: 6.0),
          Duration(seconds: 5), Curves.linear);

    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;

    return Observer(
      builder: (context) => Opacity(
        opacity: _pokemonDetailController.opacity,
        child: Padding(
            padding: EdgeInsets.only(
                top: _pokemonDetailController.opacityTitle == 1
                    ? 1000
                    : 90 - _pokemonDetailController.progress * 50),
            child: SizedBox(
              height: (heightScreen * 0.6) - 80,
              width: widthScreen,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: homeController.pokeApi.pokemons.length,
                  onPageChanged: (index) {
                    _pokemonDetailController.setCurrentPokemon(
                        homeController.pokeApi.pokemons[index]);
                    _pokemonDetailController.setCurrentIndex(index);
                    _aboutController.setCurrentSpecie(
                        _pokemonDetailController.currentPokemon.name);
                  },
                  itemBuilder: (context, int count) {
                    var pokemonItem = homeController.pokeApi.pokemons[count];

                    return Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        LoopAnimation<
                            MultiTweenValues<DefaultAnimationProperties>>(
                          tween: animationRotation,
                          duration:
                              animationRotation.duration, // Use own duration
                          builder: (context, child, value) {
                            return Transform.rotate(
                                child: Hero(
                                  child: Opacity(
                                    opacity: count ==
                                            _pokemonDetailController
                                                .currentIndex
                                        ? 0.1
                                        : 0,
                                    child: Image.asset(
                                      ConstsApp.whitePokeball,
                                      height: 250,
                                      width: 250,
                                    ),
                                  ),
                                  tag: 'pokeball' + count.toString(),
                                ),
                                angle: value
                                    .get(DefaultAnimationProperties.rotation));
                          },
                        ),
                        Observer(
                            builder: (context) => AnimatedPadding(
                                  duration: Duration(milliseconds: 250),
                                  padding: EdgeInsets.all(count ==
                                          _pokemonDetailController.currentIndex
                                      ? 0
                                      : 60),
                                  curve: Curves.bounceInOut,
                                  child: Hero(
                                    child: CachedNetworkImage(
                                        height: 250,
                                        width: 250,
                                        placeholder: (context, url) =>
                                            new Container(
                                                color: Colors.transparent),
                                        color: count ==
                                                _pokemonDetailController
                                                    .currentIndex
                                            ? null
                                            : Colors.black.withOpacity(0.2),
                                        imageUrl: sprintf(
                                            ConstsApi.urlPokeImage,
                                            [pokemonItem.num])),
                                    tag: count ==
                                            _pokemonDetailController
                                                .currentIndex
                                        ? _pokemonDetailController
                                            .currentPokemon.name
                                        : 'none' + count.toString(),
                                  ),
                                )),
                      ],
                    );
                  }),
            )),
      ),
    );
  }
}
