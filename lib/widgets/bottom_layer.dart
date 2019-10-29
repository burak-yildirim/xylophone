import 'package:flutter/material.dart';
import 'dart:math' as math;

class BottomLayer extends StatelessWidget {
  final double rotationDegree;

  BottomLayer({this.rotationDegree = 5});

  double toRadian(double degree) {
    return (math.pi * degree) / 180.0;
  }

  Widget makeRotatedStick(double radian,
      {double thickness = 30.0, Alignment alignment = Alignment.topLeft}) {
    //TODO: handle rotatedStick height by ratio
    return Transform.rotate(
      alignment: alignment,
      angle: radian,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(200.0)),
          color: Colors.grey[600],
        ),
        height: thickness,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (buildContext, boxConstraints) {
        double thickness = boxConstraints.maxWidth / 22;
        return Padding(
          padding:
              EdgeInsets.symmetric(vertical: boxConstraints.maxHeight * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              makeRotatedStick(
                toRadian(rotationDegree),
                thickness: thickness,
              ),
              makeRotatedStick(
                toRadian(-rotationDegree),
                thickness: thickness,
                alignment: Alignment.bottomLeft,
              ),
            ],
          ),
        );
      },
    );
  }
}
