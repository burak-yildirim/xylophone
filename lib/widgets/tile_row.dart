import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_xylophone/utils/constants.dart';
import 'package:my_xylophone/widgets/tile.dart';

class TileRow extends StatelessWidget {
  static const _notes = [
    Note('C', 'Do'),
    Note('D', 'Re'),
    Note('E', 'Mi'),
    Note('F', 'Fa'),
    Note('G', 'Sol'),
    Note('A', 'La'),
    Note('B', 'Si'),
    Note('C', 'Do'),
  ];

  static final List<GlobalKey> _keys =
      List<GlobalKey>.generate(8, (ndx) => GlobalKey());

  Widget makeTile(int index) {
    return Tile(
      key: _keys[index],
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
          Text(_notes[index].letter, style: kNoteTextStyle),
          Text(_notes[index].value, style: kNoteTextStyle),
        ],
      ),
    );
  }

  List<Widget> makeTileRow() {
    return List<Widget>.generate(8, (index) => makeTile(index));
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (pointerEnterEvent) {
        print('pointer down in row');
//        final result = BoxHitTestResult();
//        _keys.forEach((key) {
//          final RenderBox renderBox = key.currentContext.findRenderObject();
//          Offset offset = renderBox.globalToLocal(pointerEnterEvent.position);
//          if (renderBox.hitTest(result, position: offset))
//            print('touch on tile!');
//        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: makeTileRow(),
      ),
    );
  }
}

class Note {
  final String letter;
  final String value;
  const Note(this.letter, this.value);
}
