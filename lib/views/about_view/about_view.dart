import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';

class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PokemonDetailController _pokemonDetailController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    _pokemonDetailController = GetIt.instance<PokemonDetailController>();
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
                    tabs: <Widget>[
                      Tab(
                        text: "Sobre",
                      ),
                      Tab(
                        text: "Evolução",
                      ),
                      Tab(
                        text: "Status",
                      )
                    ],
                  );
                }))));
  }
}
