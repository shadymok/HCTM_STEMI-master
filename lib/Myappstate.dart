// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'dart:ffi';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:css_colors/css_colors.dart';
import 'package:video_player/video_player.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

//route other files
import 'package:first_test/homepage.dart';


class MyAppState extends ChangeNotifier {

String? _username;
String? get username =>_username;
  

MyAppState() {
    // loadUsername();
    _loadFavorites();
  }

  var current = WordPair.random();
  var history = <WordPair>[];
  var favorites = <WordPair>[];
  GlobalKey? historyListKey;

  void getNext() {
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    current = WordPair.random();
    notifyListeners();
  }

  Future<void> toggleFavorite([WordPair? pair]) async {
    pair = pair ?? current;
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
    await _saveFavorites();
  }

  void removeFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
    _saveFavorites();
  }

  Future<void> _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesStringList = prefs.getStringList('favorites') ?? [];
    favorites = favoritesStringList.map((word) {
      var parts = word.split('-');
      return WordPair(parts[0], parts[1]);
    }).toList();
    notifyListeners();
  }

  Future<void> _saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesStringList = favorites.map((pair) {
      return '${pair.first}-${pair.second}';
    }).toList();
    await prefs.setStringList('favorites', favoritesStringList);
  }

  Future<void> setUsername(String username) async {
    _username = username;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
  }

  Future<void> loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    _username = prefs.getString('username');
    notifyListeners();
  }

  // @override

  // var current = WordPair.random();
  // var history = <WordPair>[];

  // GlobalKey? historyListKey;
            // String? username;

            // void setUsername(String name) {
            //   username = name;
            //   notifyListeners();
            // }

  // void getNext() {
  //   history.insert(0, current);
  //   var animatedList = historyListKey?.currentState as AnimatedListState?;
  //   animatedList?.insertItem(0);
  //   current = WordPair.random();
  //   notifyListeners();
  // }

  // var favorites = <WordPair>[];

  // void toggleFavorite([WordPair? pair]) {
  //   pair = pair ?? current;
  //   if (favorites.contains(pair)) {
  //     favorites.remove(pair);
  //   } else {
  //     favorites.add(pair);
  //   }
  //   notifyListeners();
    
  // }

  // void removeFavorite(WordPair pair) {
  //   favorites.remove(pair);
  //   notifyListeners();
    
  // }
}