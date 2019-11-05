import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_xylophone/models/note_player.dart';
import 'package:my_xylophone/models/settings.dart';
import 'package:my_xylophone/utils/constants.dart';
import 'package:my_xylophone/widgets/tile.dart';
import 'package:provider/provider.dart';

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

  static final keys = List<GlobalKey>.generate(8, (ndx) => GlobalKey());

  @override
  _TileRowState createState() => _TileRowState();
}

class _TileRowState extends State<TileRow> {
  Tile lastTouchedTile;

  Widget makeTile(int index) {
    var player = NotePlayer('note$index.wav');
    player.load();
    return Flexible(
      fit: FlexFit.loose,
      child: LayoutBuilder(
        builder: (buildContext, boxConstraints) {
          double maxHeight = boxConstraints.maxHeight;
          double maxWidth = boxConstraints.maxWidth;
          return Consumer<Settings>(
            builder: (ctx, settings, child) {
              return Tile(
                key: TileRow.keys[index],
                height: maxHeight - (index * maxHeight * 0.05),
                width: maxWidth / 1.3,
                color: kTileColors[index],
                centerWidget: settings.isNoteVisible
                    ? makeTileText(index, maxWidth / 3.5)
                    : Container(),
                playNote: () => player.play(),
              );
            },
          );
        },
      ),
    );
  }

  Widget makeTileText(int index, double fontSize) {
    var style = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: Color(0x56000000),
    );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(TileRow.notes[index].letter, style: style),
          Text(TileRow.notes[index].value, style: style),
        ],
      ),
    );
  }

  List<Widget> makeTileList() {
    return List<Widget>.generate(8, (index) => makeTile(index));
  }

  Tile getTouchingTile(Offset globalPosition) {
    Tile touchedTile;
    // result is outside of [isTouchingTileKey] for performance
    final result = BoxHitTestResult();

    bool isTouchingTileKey(GlobalKey key) {
      final RenderBox renderBox = key.currentContext.findRenderObject();
      Offset offset = renderBox.globalToLocal(globalPosition);
      return renderBox.hitTest(result, position: offset);
    }

    var key = TileRow.keys.firstWhere(isTouchingTileKey, orElse: () => null);
    if (key != null) touchedTile = key.currentWidget;

    return touchedTile;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (tapDownDetails) {
        Tile touchedTile = getTouchingTile(tapDownDetails.globalPosition);
        lastTouchedTile = touchedTile;
        if (touchedTile != null) touchedTile.playNote();
      },
      onPanUpdate: (dragUpdateDetails) {
        var touchingTile = getTouchingTile(dragUpdateDetails.globalPosition);
        if (lastTouchedTile == touchingTile) return;

        lastTouchedTile = touchingTile;
        if (touchingTile != null) touchingTile.playNote();
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
