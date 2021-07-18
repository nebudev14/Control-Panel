import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;  
  

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
