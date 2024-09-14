// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/services.dart';

class MemoryGameModel {
  final String hiddenCardpath = 'assets/images/bg1.jpeg';
  List<String>? gameImg;
  late List<dynamic> jsonData; // Store loaded JSON data
  List<Map<int, String>> matchCheck = [];

  final int cardCount = 0;

  Future<void> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    jsonData = json.decode(jsonString);
  }

  void initMemoryGame() {
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }

// () {
//                         setState(() {
//                           tries++;
//                           _jsonData[index] = _jsonData1[index]['image'];
//                           _game.matchCheck
//                               .add({index: _jsonData1[index]['image']});
//                         });
//                         if (_game.matchCheck.length == 2) {
//                           if (_game.matchCheck[0].values.first ==
//                               _game.matchCheck[1].values.first) {
//                             score += 100;
//                             _game.matchCheck.clear();
//                             _flutterTts.setLanguage('AR');
//                             _flutterTts.speak('إجابة صحيحة');
//                           } else {
//                             Future.delayed(const Duration(milliseconds: 500),
//                                 () {
//                               _game.gameImg![_game.matchCheck[0].keys.first] =
//                                   _game.hiddenCardpath;
//                               _game.gameImg![_game.matchCheck[1].keys.first] =
//                                   _game.hiddenCardpath;
//                               _game.matchCheck.clear();
//                             });
//                           }
//                         }
//                       }
}
