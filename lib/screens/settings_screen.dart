import 'package:flutter/material.dart';
import 'package:my_xylophone/models/note_visibility.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends SimpleDialog {
  SettingsScreen._init({@required context})
      : super(
          title: Text('Settings'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Provider.of<NoteVisibility>(context).toggleVisibility();
              },
              child: Consumer<NoteVisibility>(
                builder: (ctx, noteVisibility, child) {
                  noteVisibility = Provider.of<NoteVisibility>(context);
                  return Text(
                    noteVisibility.isVisible ? 'Hide' : 'Show',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ),
          ],
        );
  static void show(BuildContext buildContext) {
    showDialog(
      context: buildContext,
      builder: (ctx) => SettingsScreen._init(context: ctx),
    );
  }
}

/*
SimpleDialog(
  title: Text('Settings'),
  children: <Widget>[
    SimpleDialogOption(
      onPressed: () {
        Provider.of<NoteVisibility>(context).toggleVisibility();
      },
      child: Consumer<NoteVisibility>(
        builder: (ctx, noteVisibility, child) {
          return Text(
            noteVisibility.isVisible ? 'Hide' : 'Show',
            style: TextStyle(
              color: Colors.white,
            ),
          );
        },
      ),
    ),
  ],
);
*/

/*
Builder(
  builder: (buildContext) {
    return FlatButton(
      color: Colors.green,
      child: Consumer<NoteVisibility>(
        builder: (ctx, noteVisibility, child) {
          return Text(
            noteVisibility.isVisible ? 'Hide' : 'Show',
            style: TextStyle(
              color: Colors.white,
            ),
          );
        },
      ),
      onPressed: () {
        Provider.of<NoteVisibility>(buildContext)
            .toggleVisibility();
      },
    );
  },
)
*/
