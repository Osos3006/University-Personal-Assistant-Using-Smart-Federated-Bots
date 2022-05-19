/*
  this screen represents the FAQ screen that has all the common questions asked 
  about the project in terms of who are you talking to? what are the available 
  services? who is this app for? 
*/


import 'package:flutter/material.dart';
import 'package:thesis/res/custom_colors.dart';
import 'package:thesis/screens/About.dart';
import 'package:thesis/screens/BotWelcome.dart';
import 'package:thesis/screens/BotScreen.dart';
import 'package:thesis/utils/authentication.dart';
import 'package:thesis/widgets/google_sign_in_button.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQ createState() => _FAQ();
}

class _FAQ extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Frequently Asked Questions'),
        centerTitle: true,
        backgroundColor: CustomColors.firebaseNavy,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Padding(
              padding: new EdgeInsets.all(10.0),
              child: Text(
                "Who am I talking to?",
                style: TextStyle(
                  color: CustomColors.firebaseNavy,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: new EdgeInsets.all(10.0),
              child: Text(
                "You are talking to AUC assistant dispatcher bot.",
                style: TextStyle(
                  color: CustomColors.firebaseNavy,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: new EdgeInsets.all(10.0),
              child: Text(
                "What Services are available?",
                style: TextStyle(
                  color: CustomColors.firebaseNavy,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: new EdgeInsets.all(10.0),
              child: Text(
                "Library, CSCE Department, OSL, Registrar, Sports complex and Travel Office services are available.",
                style: TextStyle(
                  color: CustomColors.firebaseNavy,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: new EdgeInsets.all(10.0),
              child: Text(
                "Who is this app for?",
                style: TextStyle(
                  color: CustomColors.firebaseNavy,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: new EdgeInsets.all(10.0),
              child: Text(
                "AUC Faculty, students and staff who need services and information around campus.",
                style: TextStyle(
                  color: CustomColors.firebaseNavy,
                  fontSize: 20,
                ),
              ),
            ),
          ])),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: ExactAssetImage('assets/bot_logo.png'),
                ),
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BotWelcome()));
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => About()));
              },
            ),
            ListTile(
              title: const Text('Frequently Asked Questions'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => FAQ()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
