import 'package:flutter/foundation.dart';

class Settings extends ChangeNotifier {
  bool _isNoteVisible = true;

  bool get isNoteVisible => _isNoteVisible;

  void toggleNoteVisibility() {
    _isNoteVisible = !_isNoteVisible;
    notifyListeners();
  }
}
