import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';
import 'package:pokedex/views/about_view/widgets/about_aba_widget.dart';
import 'package:pokedex/views/about_view/widgets/evolution_aba_widget.dart';
import 'package:pokedex/views/about_view/widgets/stats_aba_widget.dart';

class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  PokemonDetailController _pokemonDetailController;
  ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(initialPage: 0);
    _pokemonDetailController = GetIt.instance<PokemonDetailController>();

    _disposer = reaction(
        (f) => _pokemonDetailController.currentPokemon,
        (r) => () {
              _pageController.animateToPage(0,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            });
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(10),
              child: Observer(builder: (context) {
                return TabBar(
                  controller: _tabController,
                  labelStyle: TextStyle(fontWeight: FontWeight.w700),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: _pokemonDetailController.currentColor,
                  unselectedLabelColor: Color(0xff5f6368),
                  isScrollable: true,
                  indicator: MD2Indicator(
                      //it begins here
                      indicatorHeight: 3,
                      indicatorColor: _pokemonDetailController.currentColor,
                      indicatorSize: MD2IndicatorSize
                          .normal //3 different modes tiny-normal-full
                      ),
                  onTap: (index) {
                    _pageController.animateToPage(index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  tabs: <Widget>[
                    Tab(
                      text: "About",
                    ),
                    Tab(
                      text: "Evolution",
                    ),
                    Tab(
                      text: "Base Stats",
                    )
                  ],
                );
              }))),
      body: PageView(
        onPageChanged: (index) {
          _tabController.animateTo(index,
              duration: Duration(milliseconds: 300));
        },
        controller: _pageController,
        children: <Widget>[
          AboutAba(),
          EvolutionAba(),
          StatesAba(),
        ],
      ),
    );
  }
}
