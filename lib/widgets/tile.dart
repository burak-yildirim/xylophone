import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final Key key;
  final double width;
  final double height;
  final Color color;
  final Widget centerWidget;
  final Function playNote;

  Widget makeTileButton([double radius = 10.0]) {
    return CircleAvatar(
      backgroundColor: Colors.grey[400],
      radius: radius,
    );
  }

  Tile({
    this.key,
    this.width,
    this.height,
    this.color,
    this.centerWidget,
    this.playNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(width / 2),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: width / 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            makeTileButton(width / 6),
            centerWidget,
            makeTileButton(width / 6),
          ],
        ),
      ),
    );
  }
}
