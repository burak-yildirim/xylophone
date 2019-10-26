import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_xylophone/utils/constants.dart';

class TileRow extends StatelessWidget {
  final _tileColors = [
    Colors.purple,
    Color(0xff2a54eb),
    Colors.blue,
    Colors.green,
    Color(0xffbbeb2a),
    Colors.yellow[600],
    Colors.orange[700],
    Colors.red,
  ];

  final _notes = [
    Note('C', 'Do'),
    Note('D', 'Re'),
    Note('E', 'Mi'),
    Note('F', 'Fa'),
    Note('G', 'Sol'),
    Note('A', 'La'),
    Note('B', 'Si'),
    Note('C', 'Do'),
  ];

  Widget makeTile(int index) {
    return GestureDetector(
      onTapDown: (tapDownDetails) {
        print('tapped down');
      },
      child: Container(
          width: 60.0,
          height: 250.0 - (index * 20),
          color: _tileColors[index],
          child: makeTileText(index)),
    );
  }

  Widget makeTileText(int index) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_notes[index].first, style: kNoteTextStyle),
          Text(_notes[index].second, style: kNoteTextStyle),
        ],
      ),
    );
  }

  List<Widget> makeTileRow() {
    return List<Widget>.generate(8, (index) => makeTile(index));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: makeTileRow(),
    );
  }
}

class Note {
  final String first;
  final String second;
  const Note(this.first, this.second);
}
