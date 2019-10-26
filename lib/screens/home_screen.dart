import 'package:flutter/material.dart';
import 'package:my_xylophone/utils/constants.dart';
import 'package:my_xylophone/widgets/bottom_layer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: <Widget>[
              BottomLayer(),
              Center(
                child: Container(
                  width: 60.0,
                  height: 160.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
