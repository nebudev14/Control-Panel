import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/musicInfo.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          accentColor: Colors.greenAccent[400], brightness: Brightness.dark),
      home: MusicInformation(title: 'Control Panel'),
    );
  }
}
