import 'package:flutter/material.dart';
import 'package:my_xylophone/utils/constants.dart';
import 'package:my_xylophone/widgets/bottom_layer.dart';
import 'package:my_xylophone/widgets/tile_row.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              BottomLayer(),
              TileRow(),
            ],
          ),
        ),
      ),
    );
  }
}
