import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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
        primarySwatch: Colors.blue,
      ),
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
  getSongData() async {
    const url = 'http://localhost:5000/musicinfo';
    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    return jsonDecode(response.body)['info']['title'].toString();
  }

  void previousSong() async {
    const url = 'http://localhost:5000/music';
    const info = {"query": "prev"};
    var response = await http.post(url,
        body: jsonEncode(info), headers: {'Content-Type': 'application/json'});
    print(response.body);
  }

  void playSong() async {
    const url = 'http://localhost:5000/music';
    const info = {"query": "play_pause"};
    var response = await http.post(url,
        body: jsonEncode(info), headers: {'Content-Type': 'application/json'});
    print(response.body);
  }

  void nextSong() async {
    const url = 'http://localhost:5000/music';
    const info = {"query": "next"};
    var response = await http.post(url,
        body: jsonEncode(info), headers: {'Content-Type': 'application/json'});
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(songTitle),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
                onPressed: previousSong,
                tooltip: 'Previous song',
                child: Icon(Icons.skip_previous)),
            FloatingActionButton(
                onPressed: playSong,
                tooltip: 'Play Song',
                child: Icon(Icons.play_arrow)),
            FloatingActionButton(
                onPressed: nextSong,
                tooltip: 'Next Song',
                child: Icon(Icons.skip_next)),
            FloatingActionButton(
                onPressed: getSongData,
                tooltip: 'Get Song Data',
                child: Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
