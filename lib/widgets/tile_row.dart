import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_xylophone/utils/constants.dart';

class TileRow extends StatelessWidget {
  static final _tileColors = [
    Colors.purple,
    Color(0xff2a54eb),
    Colors.blue,
    Colors.green,
    Color(0xffbbeb2a),
    Colors.yellow[800],
    Colors.deepOrange,
    Colors.red,
  ];

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
    return Container(
      key: _keys[index],
      width: 60.0,
      height: 250.0 - (index * 20),
      color: _tileColors[index],
      child: makeTileText(index),
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
        final result = BoxHitTestResult();
        _keys.forEach((key) {
          final RenderBox renderBox = key.currentContext.findRenderObject();
          Offset offset = renderBox.globalToLocal(pointerEnterEvent.position);
          if (renderBox.hitTest(result, position: offset))
            print('touch happened!');
        });
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
