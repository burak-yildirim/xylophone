import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_xylophone/utils/constants.dart';
import 'package:my_xylophone/widgets/tile.dart';

class TileRow extends StatefulWidget {
  static const notes = [
    Note('C', 'Do'),
    Note('D', 'Re'),
    Note('E', 'Mi'),
    Note('F', 'Fa'),
    Note('G', 'Sol'),
    Note('A', 'La'),
    Note('B', 'Si'),
    Note('C', 'Do'),
  ];

  static final List<GlobalKey> keys =
      List<GlobalKey>.generate(8, (ndx) => GlobalKey());

  @override
  _TileRowState createState() => _TileRowState();
}

class _TileRowState extends State<TileRow> {
  Tile lastTouchedTile = Tile(playNote: () => print('No note assigned!'));

  Widget makeTile(int index) {
    var player = AudioCache();
    return Flexible(
      fit: FlexFit.loose,
      child: LayoutBuilder(
        builder: (buildContext, boxConstraints) {
          double maxHeight = boxConstraints.maxHeight;
          double maxWidth = boxConstraints.maxWidth;
          return Tile(
            key: TileRow.keys[index],
//          height: 250.0 - (index * 14.5),
            height: maxHeight - (index * maxHeight * 0.05),
            width: maxWidth / 1.3,
            color: kTileColors[index],
            centerWidget: makeTileText(index),
            playNote: () => player.play('note$index.wav'),
          );
        },
      ),
    );
  }

  Widget makeTileText(int index) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(TileRow.notes[index].letter, style: kNoteTextStyle),
          Text(TileRow.notes[index].value, style: kNoteTextStyle),
        ],
      ),
    );
  }

  List<Widget> makeTileList() {
    return List<Widget>.generate(8, (index) => makeTile(index));
  }

  Tile getTouchingTile(Offset globalPosition) {
    Tile touchedTile;
    final result = BoxHitTestResult();
    TileRow.keys.forEach((tileKey) {
      final RenderBox renderBox = tileKey.currentContext.findRenderObject();
      Offset offset = renderBox.globalToLocal(globalPosition);
      if (renderBox.hitTest(result, position: offset)) {
        touchedTile = tileKey.currentWidget;
      }
    });
    return touchedTile;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (tapDownDetails) {
        Tile touchedTile = getTouchingTile(tapDownDetails.globalPosition);
        lastTouchedTile = touchedTile;
        if (touchedTile == null) return;
        touchedTile.playNote();
      },
      onPanUpdate: (dragUpdateDetails) {
        Tile touchingTile = getTouchingTile(dragUpdateDetails.globalPosition);
        if (touchingTile == null || lastTouchedTile == touchingTile) return;
        lastTouchedTile = touchingTile;
        touchingTile.playNote();
      },
      child: Container(
        color: kTransparentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: makeTileList(),
        ),
      ),
    );
  }
}

class Note {
  final String letter;
  final String value;
  const Note(this.letter, this.value);
}
