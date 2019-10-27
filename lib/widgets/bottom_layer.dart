import 'package:flutter/material.dart';
import 'dart:math' as math;

class BottomLayer extends StatelessWidget {
  final double rotateDegree;

  BottomLayer({this.rotateDegree = 5});

  double toRadian(double degree) {
    return (math.pi * degree) / 180.0;
  }

  Widget rotatedStick(double radian,
      [Alignment alignment = Alignment.topLeft]) {
    return Transform.rotate(
      alignment: alignment,
      angle: radian,
      child: Container(
//        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.brown[700],
        ),
        height: 30.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        rotatedStick(toRadian(rotateDegree)),
        SizedBox(
          height: 140.0,
        ),
        rotatedStick(toRadian(-rotateDegree), Alignment.bottomLeft),
      ],
    );
  }
}
