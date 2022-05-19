/*
  this screen represents the about screen that has all the details of 
  the project in terms of its purpose, who are the engineers who developed it, 
  and under the supervision of which professors. 
*/

import 'package:flutter/material.dart';
import 'package:thesis/res/custom_colors.dart';
import 'package:thesis/screens/FAQ.dart';
import 'package:thesis/screens/BotWelcome.dart';
import 'package:thesis/screens/BotScreen.dart';
import 'package:thesis/utils/authentication.dart';
import 'package:thesis/widgets/google_sign_in_button.dart';


class About extends StatefulWidget {
  @override
  _About createState() => _About();
}
class _About extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('About'), centerTitle: true, backgroundColor: CustomColors.firebaseNavy,),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: new EdgeInsets.all(10.0),
                  child:
                  Text(
                    "Project",
                    style: TextStyle(
                      color: CustomColors.firebaseNavy,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.all(10.0),
                  child:
                  Text(
                    "This AUC Assistant is a thesis project. It is designed to help AUC students to have a smoother experience. The application employs a workforce of bots to achieve tasks.",
                    style: TextStyle(
                      color: CustomColors.firebaseNavy,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.all(10.0),
                  child:
                  Text(
                    "Supervisors",
                    style: TextStyle(
                      color: CustomColors.firebaseNavy,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.all(10.0),
                  child:
                  Text(
                    "Dr. Sherif Ali",
                    style: TextStyle(
                      color: CustomColors.firebaseNavy,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.all(10.0),
                  child:
                  Text(
                    "Dr. Cherif Salama",
                    style: TextStyle(
                      color: CustomColors.firebaseNavy,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.all(10.0),
                  child:
                  Text(
                    "Group Members:",
                    style: TextStyle(
                      color: CustomColors.firebaseNavy,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.all(10.0),
                  child:
                  Text(
                    "Nada Askar",
                    style: TextStyle(
                      color: CustomColors.firebaseNavy,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.all(10.0),
                  child:
                  Text(
                    "Donia Ghazy",
                    style: TextStyle(
                      color: CustomColors.firebaseNavy,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.all(10.0),
                  child:
                  Text(
                    "Tarek Khalifa",
                    style: TextStyle(
                      color: CustomColors.firebaseNavy,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.all(10.0),
                  child:
                  Text(
                    "Osama Wahsh",
                    style: TextStyle(
                      color: CustomColors.firebaseNavy,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.all(10.0),
                  child:
                  Text(
                    "Hussam Gawish",
                    style: TextStyle(
                      color: CustomColors.firebaseNavy,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.all(10.0),
                  child:
                  Text(
                    "Mohammed Abuelwafa",
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => BotWelcome()));
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => About()));
              },
            ),
            ListTile(
              title: const Text('Frequently Asked Questions'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FAQ()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
