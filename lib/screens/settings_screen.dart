import 'package:flutter/material.dart';
import 'package:my_xylophone/models/settings.dart';
import 'package:provider/provider.dart';

class SettingsScreen {
  static Widget _getDialog(BuildContext context) {
    return SimpleDialog(
      title: Text('Settings'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            Provider.of<Settings>(context).toggleNoteVisibility();
          },
          child: Consumer<Settings>(
            builder: (ctx, settings, child) {
              return Text(
                settings.isNoteVisible ? 'Hide' : 'Show',
                style: TextStyle(
                  color: Colors.black,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  static void show(BuildContext buildContext) {
    showDialog(
      context: buildContext,
      builder: (ctx) => _getDialog(ctx),
    );
  }
}
