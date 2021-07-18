import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'musicFunctions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          accentColor: Colors.greenAccent[400], brightness: Brightness.dark),
      home: MyHomePage(title: 'Control Panel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentSong = "";
  String _currentArtist = "";

  void getSongData() async {
    const url = 'http://localhost:5000/musicinfo';
    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    setState(() {
      _currentSong = jsonDecode(response.body)['info']['title'].toString();
      _currentArtist = jsonDecode(response.body)['info']['artist'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now playing: $_currentSong by $_currentArtist'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(60.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        height: 80.0,
                        width: 80.0,
                        child: FloatingActionButton(
                            onPressed: previousSong,
                            tooltip: 'Previous song',
                            child: Icon(Icons.skip_previous))),
                    Container(
                        height: 80.0,
                        width: 80.0,
                        child: FloatingActionButton(
                            onPressed: playSong,
                            tooltip: 'Play Song',
                            child: Icon(Icons.play_arrow))),
                    Container(
                        height: 80.0,
                        width: 80.0,
                        child: FloatingActionButton(
                            onPressed: nextSong,
                            tooltip: 'Next Song',
                            child: Icon(Icons.skip_next))),
                  ]),
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        height: 80.0,
                        width: 80.0,
                        child: FloatingActionButton(
                            onPressed: getSongData,
                            tooltip: 'Get Song Data',
                            child: Icon(Icons.refresh))),
                  ]),
            )
          ]),
    );
  }
}
