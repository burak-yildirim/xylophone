import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_xylophone/models/settings.dart';
import 'package:my_xylophone/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft]);
  runApp(
    ChangeNotifierProvider(
      builder: (ctx) => Settings(),
      child: MyApp(),
    ),
  );
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
