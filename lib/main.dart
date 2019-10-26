import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_xylophone/screens/home_screen.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    Wakelock.enable();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
