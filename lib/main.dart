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

//route other files
import 'package:first_test/homepage.dart';
import 'package:first_test/Myappstate.dart';
import 'splashscreen.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final appState = MyAppState();
        appState.loadUsername();  // Load username here
        return appState;
      } , 
      child: MaterialApp(
        title: 'First Try',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            
            ),
        ),
        home: SplashScreen()
      ),
    );
  }
}
