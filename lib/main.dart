// the file represents the main file that's run in order to build the whole 
//application. it starts the signInScreen.dart 

import 'package:flutter/material.dart';
import 'package:thesis/screens/BotScreen.dart';
import 'screens/sign_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AUC Personal Assistant Thesis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: SignInScreen(),
    );
  }
}
