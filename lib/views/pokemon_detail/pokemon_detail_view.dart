import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:sprintf/sprintf.dart';
import 'package:sa_multi_tween/sa_multi_tween.dart';

class PokemonDetailView extends StatefulWidget {
  final int index;

  const PokemonDetailView({Key key, this.index}) : super(key: key);

  @override
  _PokemonDetailViewState createState() => _PokemonDetailViewState();
}

HomeController homeController;
PokemonDetailController pokemonDetailController;
PageController pageController;
MultiTween<DefaultAnimationProperties> animationRotation;

class _PokemonDetailViewState extends State<PokemonDetailView> {
  @override
  void initState() {
    super.initState();
    homeController = GetIt.instance<HomeController>();
    pokemonDetailController = GetIt.instance<PokemonDetailController>();

    pageController = PageController(initialPage: widget.index);
    pokemonDetailController.setCurrentColor(ConstsApp.getColorType(
        type: pokemonDetailController.currentPokemon.type[0]));

    animationRotation = MultiTween<DefaultAnimationProperties>()
      ..add(DefaultAnimationProperties.rotation, Tween(begin: 0.0, end: 6.0),
          Duration(seconds: 5), Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Observer(
            builder: (_) {
              return AppBar(
                backgroundColor: pokemonDetailController.currentColor,
                elevation: 0.0,
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.favorite_border), onPressed: () {})
                ],
              );
            },
          )),
      body: Stack(
        children: <Widget>[
          Observer(builder: (_) {
            return Container(color: pokemonDetailController.currentColor);
          }),
          Container(
            height: heightScreen / 3,
          ),
          SlidingSheet(
            elevation: 0,
            cornerRadius: 30,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.7, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                height: heightScreen,
              );
            },
          ),
          Positioned(
              top: (heightScreen / 3) - 180,
              child: Container(
                height: 250,
                width: widthScreen,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: homeController.pokeApi.pokemons.length,
                    onPageChanged: (index) {
                      pokemonDetailController.setCurrentPokemon(
                          homeController.pokeApi.pokemons[index]);
                      pokemonDetailController.setCurrentColor(
                          ConstsApp.getColorType(
                              type: homeController
                                  .pokeApi.pokemons[index].type[0]));
                      pokemonDetailController.setCurrentIndex(index);
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
                                      opacity: 0.1,
                                      child: Image.asset(
                                        ConstsApp.whitePokeball,
                                        height: 250,
                                        width: 250,
                                      ),
                                    ),
                                    tag: count.toString(),
                                  ),
                                  angle: value.get(
                                      DefaultAnimationProperties.rotation));
                            },
                          ),
                          Observer(
                              builder: (context) => AnimatedPadding(
                                    duration: Duration(milliseconds: 250),
                                    padding: EdgeInsets.all(count ==
                                            pokemonDetailController.currentIndex
                                        ? 0
                                        : 100),
                                    curve: Curves.bounceInOut,
                                    child: Hero(
                                      child: CachedNetworkImage(
                                          height: 250,
                                          width: 250,
                                          placeholder: (context, url) =>
                                              new Container(
                                                  color: Colors.transparent),
                                          color: count ==
                                                  pokemonDetailController
                                                      .currentIndex
                                              ? null
                                              : Colors.black.withOpacity(0.2),
                                          imageUrl: sprintf(
                                              ConstsApi.urlPokeImage,
                                              [pokemonItem.num])),
                                      tag: pokemonDetailController
                                          .currentPokemon.num
                                          .toString(),
                                    ),
                                  ))
                        ],
                      );
                    }),
              ))
        ],
      ),
    );
  }
}
