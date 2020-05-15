import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/controllers/pokemon_detail_controller.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class SlidingSheetWidget extends StatelessWidget {
  final _pokemonDetailController = GetIt.instance<PokemonDetailController>();

  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;

    return SlidingSheet(
      elevation: 0,
      cornerRadius: 30,
      listener: (state) {
        _pokemonDetailController.setProgress(state.progress);
        _pokemonDetailController.setMultiple(1 -
            _pokemonDetailController.interval(
                0.0, 0.6, _pokemonDetailController.progress));
        _pokemonDetailController.setOpacity(_pokemonDetailController.multiple);
        _pokemonDetailController.setOpacityTitle(_pokemonDetailController
            .interval(0.55, 0.8, _pokemonDetailController.progress));
      },
      snapSpec: const SnapSpec(
        snap: true,
        snappings: [0.6, 0.9],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      builder: (context, state) {
        return Container(
          height: heightScreen,
        );
      },
    );
  }
}
