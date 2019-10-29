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
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 50.0,
              ),
              child: Center(
                child: AspectRatio(
                  aspectRatio: kBoardRatio,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      BottomLayer(),
                      TileRow(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: FlatButton(
                color: Colors.green,
                child: Text('hello'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
