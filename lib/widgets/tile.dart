import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final Key key;
  final double width;
  final double height;
  final Color color;
  final Widget centerWidget;
  final Function playNote;

  final tileButton = CircleAvatar(
    backgroundColor: Colors.grey[400],
    radius: 10.0,
  );

  Tile({
    this.key,
    this.width = 60.0,
    this.height,
    this.color,
    this.centerWidget,
    this.playNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            tileButton,
            centerWidget,
            tileButton,
          ],
        ),
      ),
    );
  }
}
