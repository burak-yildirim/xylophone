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
  Tile lastTouchedTile = Tile();

  Widget makeTile(int index) {
    return Tile(
      key: TileRow.keys[index],
      height: 250.0 - (index * 14.5),
      color: kTileColors[index],
      centerWidget: makeTileText(index),
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

  List<Widget> makeTileRow() {
    return List<Widget>.generate(8, (index) => makeTile(index));
  }

  Tile getTouchingTile(Offset globalPosition) {
    Tile touchedTile;
    final result = BoxHitTestResult();
    TileRow.keys.forEach((tileKey) {
      final RenderBox renderBox = tileKey.currentContext.findRenderObject();
      Offset offset = renderBox.globalToLocal(globalPosition);
      //TODO: implement holding the hovered tile in a variable
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
        print('touchedTile: ${touchedTile.color}');
      },
      onPanUpdate: (dragUpdateDetails) {
        //TODO: implement panUpdate
        Tile touchingTile = getTouchingTile(dragUpdateDetails.globalPosition);
        if (touchingTile != null && lastTouchedTile != touchingTile) {
          lastTouchedTile = touchingTile;
          print(touchingTile.color);
        }
      },
      child: Container(
        color: kTransparentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: makeTileRow(),
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

/*
onPointerDown: (pointerDownEvent) {
        //TODO: implement single tap on tile
        handleRowTouch(pointerDownEvent);
      },
      onPointerMove: (pointerMoveEvent) {
        print('pointer down in row');
        handleRowTouch(pointerMoveEvent);
      },
*/
