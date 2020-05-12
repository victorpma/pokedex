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

HomeController _homeController;
PokemonDetailController _pokemonDetailController;
PageController _pageController;
MultiTween<DefaultAnimationProperties> _animationRotation;
double _progress;
double _multiple;
double _opacity;
double _opacityTitle;

class _PokemonDetailViewState extends State<PokemonDetailView> {
  @override
  void initState() {
    super.initState();
    _homeController = GetIt.instance<HomeController>();
    _pokemonDetailController = GetIt.instance<PokemonDetailController>();

    _pageController = PageController(initialPage: widget.index);
    _pokemonDetailController.setCurrentColor(ConstsApp.getColorType(
        type: _pokemonDetailController.currentPokemon.type[0]));

    _animationRotation = MultiTween<DefaultAnimationProperties>()
      ..add(DefaultAnimationProperties.rotation, Tween(begin: 0.0, end: 6.0),
          Duration(seconds: 5), Curves.linear);

    _progress = 0;
    _multiple = 1;
    _opacity = 1;
    _opacityTitle = 0;
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
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
                backgroundColor: _pokemonDetailController.currentColor,
                elevation: 0.0,
                title: Opacity(
                    opacity: _opacityTitle,
                    child: Text(_pokemonDetailController.currentPokemon.name)),
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
            return Container(color: _pokemonDetailController.currentColor);
          }),
          Container(
            height: heightScreen / 3,
          ),
          SlidingSheet(
            elevation: 0,
            cornerRadius: 30,
            listener: (state) => {
              setState(() {
                _progress = state.progress;
                _multiple = 1 - interval(0.0, 0.7, _progress);
                _opacity = _multiple;
                _opacityTitle = interval(0.55, 0.8, _progress);
              })
            },
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
          Opacity(
            opacity: _opacity,
            child: Padding(
                padding: EdgeInsets.only(
                    top: _opacityTitle == 1 ? 1000 : 90 - _progress * 50),
                child: SizedBox(
                  height: 200,
                  width: widthScreen,
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: _homeController.pokeApi.pokemons.length,
                      onPageChanged: (index) {
                        _pokemonDetailController.setCurrentPokemon(
                            _homeController.pokeApi.pokemons[index]);
                        _pokemonDetailController.setCurrentColor(
                            ConstsApp.getColorType(
                                type: _homeController
                                    .pokeApi.pokemons[index].type[0]));
                        _pokemonDetailController.setCurrentIndex(index);
                      },
                      itemBuilder: (context, int count) {
                        var pokemonItem =
                            _homeController.pokeApi.pokemons[count];

                        return Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            LoopAnimation<
                                MultiTweenValues<DefaultAnimationProperties>>(
                              tween: _animationRotation,
                              duration: _animationRotation
                                  .duration, // Use own duration
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
                                              _pokemonDetailController
                                                  .currentIndex
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
                                                    _pokemonDetailController
                                                        .currentIndex
                                                ? null
                                                : Colors.black.withOpacity(0.2),
                                            imageUrl: sprintf(
                                                ConstsApi.urlPokeImage,
                                                [pokemonItem.num])),
                                        tag: _pokemonDetailController
                                            .currentPokemon.num
                                            .toString(),
                                      ),
                                    ))
                          ],
                        );
                      }),
                )),
          )
        ],
      ),
    );
  }
}
