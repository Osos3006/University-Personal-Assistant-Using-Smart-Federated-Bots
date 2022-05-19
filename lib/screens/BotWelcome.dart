/*  
this screen represents the home screen that provides the users with two options
either to talk to the single agent or to talk to the bot federation in addition 
to having the side navigation bar that has all the other screens 

PS: the file includes some backend functions for DB manipulation that were 
moved to the cloud through google Dialogflow cloud functions. 
*/


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:thesis/res/custom_colors.dart';
import 'package:thesis/screens/BotScreen.dart';
import 'package:thesis/screens/user_info_screen.dart';
import 'package:thesis/screens/About.dart';
import 'package:thesis/screens/FAQ.dart';
import 'package:thesis/utils/authentication.dart';
import 'package:thesis/widgets/google_sign_in_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thesis/widgets/GetUserName.dart';

const IconData person = IconData(0xe491, fontFamily: 'MaterialIcons');
const IconData people = IconData(0xe486, fontFamily: 'MaterialIcons');

class BotWelcome extends StatefulWidget {
  @override
  _BotWelcome createState() => _BotWelcome();
}

class _BotWelcome extends State<BotWelcome> {
  _reserveChair(chairNumber, month, day, hour, id) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('library');
    users
        .add({
          'month': month,
          'day': day,
          'hour': hour,
          'chairNumber': chairNumber,
          'roomNumber': -1,
          'id': id
        })
        .then((value) => print("Chair Added"))
        .catchError((error) => print("Failed to add chair: $error"));
  }

  reserveChair(chairNumber, month, day, hour, id) async {
    int result = 0;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('library');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    allData.forEach((document) {
      if (document['chairNumber'] == chairNumber) {
        if (document['hour'] == hour &&
            document['month'] == month &&
            document['day'] == day) {
          result = 1;
        }
      }
    });
    if (result == 0) {
      _reserveChair(chairNumber, month, day, hour, id);
    } else {
      print("Chair already booked at this hour");
    }
    return result;
  }

  _reserveClass(classNumber, month, day, hour, id) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('classes');
    users
        .add({
          'month': month,
          'day': day,
          'hour': hour,
          'classNumber': classNumber,
          'id': id
        })
        .then((value) => print("Chair Added"))
        .catchError((error) => print("Failed to add chair: $error"));
  }

  reserveClass(classNumber, month, day, hour, id) async {
    int result = 0;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('classes');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    allData.forEach((document) {
      if (document['classNumber'] == classNumber) {
        if (document['hour'] == hour &&
            document['month'] == month &&
            document['day'] == day) {
          result = 1;
        }
      }
    });
    if (result == 0) {
      _reserveClass(classNumber, month, day, hour, id);
    } else {
      print("Chair already booked at this hour");
    }
    return result;
  }

  _reserveRoom(roomNumber, month, day, hour, id) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('library');
    users
        .add({
          'month': month,
          'day': day,
          'hour': hour,
          'chairNumber': -1,
          'roomNumber': roomNumber,
          'id': id
        })
        .then((value) => print("Room Added"))
        .catchError((error) => print("Failed to add room: $error"));
  }

  reserveRoom(roomNumber, month, day, hour, id) async {
    int result = 0;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('library');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    allData.forEach((document) {
      if (document['roomNumber'] == roomNumber) {
        if (document['hour'] == hour &&
            document['month'] == month &&
            document['day'] == day) {
          result = 1;
        }
      }
    });
    if (result == 0) {
      _reserveRoom(roomNumber, month, day, hour, id);
    } else {
      print("Room already booked at this hour");
    }
    return result;
  }

  checkBook(bookNumber) async {
    int result = 0;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('books');
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    allData.forEach((document) {
      if (document['bookNumber'] == bookNumber) {
        if (document['available']) {
          result = 1;
        }
      }
    });
    return result;
  }

  _reserveStudyAbroadMeeting(month, day, hour, id) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('studyAbroad');
    users
        .add({'month': month, 'day': day, 'hour': hour, 'id': id})
        .then((value) => print("Room Added"))
        .catchError((error) => print("Failed to add room: $error"));
  }

  reserveStudyAbroadMeeting(month, day, hour, id) async {
    int result = 0;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('studyAbroad');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    allData.forEach((document) {
      if (document['hour'] == hour &&
          document['month'] == month &&
          document['day'] == day) {
        result = 1;
      }
    });
    if (result == 0) {
      _reserveStudyAbroadMeeting(month, day, hour, id);
    } else {
      print("Meeting already booked at this hour");
    }
    return result;
  }

  _setAdvisingMeeting(month, day, hour, id) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('advising');
    users
        .add({'month': month, 'day': day, 'hour': hour, 'id': id})
        .then((value) => print("Room Added"))
        .catchError((error) => print("Failed to add room: $error"));
  }

  setAdvisingMeeting(month, day, hour, id) async {
    int result = 0;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('advising');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    allData.forEach((document) {
      if (document['hour'] == hour &&
          document['month'] == month &&
          document['day'] == day) {
        result = 1;
      }
    });
    if (result == 0) {
      _setAdvisingMeeting(month, day, hour, id);
    } else {
      print("Meeting already booked at this hour");
    }
    return result;
  }

  requestDocument(documentType, count, id) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('officialDocuments');
    users
        .add({'documentType': documentType, 'count': count, 'id': id})
        .then((value) => print("Room Added"))
        .catchError((error) => print("Failed to add room: $error"));
  }

  _setGymBooking(month, day, hour, id) async {
    CollectionReference users = FirebaseFirestore.instance.collection('gym');
    users
        .add({'month': month, 'day': day, 'hour': hour, 'id': id})
        .then((value) => print("Gym slot Added"))
        .catchError((error) => print("Failed to add room: $error"));
  }

  setGymBooking(month, day, hour, id) async {
    int result = 0;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('gym');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    allData.forEach((document) {
      if (document['hour'] == hour &&
          document['month'] == month &&
          document['day'] == day) {
        result = 1;
      }
    });
    if (result == 0) {
      _setGymBooking(month, day, hour, id);
    } else {
      print("gym already booked at this hour");
    }
    return result;
  }

  _setPoolBooking(month, day, hour, id) async {
    CollectionReference users = FirebaseFirestore.instance.collection('pool');
    users
        .add({'month': month, 'day': day, 'hour': hour, 'id': id})
        .then((value) => print("pool slot Added"))
        .catchError((error) => print("Failed to add room: $error"));
  }

  setPoolBooking(month, day, hour, id) async {
    int result = 0;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('pool');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    allData.forEach((document) {
      if (document['hour'] == hour &&
          document['month'] == month &&
          document['day'] == day) {
        result = 1;
      }
    });
    if (result == 0) {
      _setPoolBooking(month, day, hour, id);
    } else {
      print("pool already booked at this hour");
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        backgroundColor: CustomColors.firebaseNavy,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Image.asset('assets/auclogo.png'),
            Image.asset('assets/bot_logo.png'),
            Padding(
                padding: new EdgeInsets.all(30.0),
                child: Text(
                  "Hello, How can I help you?",
                  style: TextStyle(
                    color: CustomColors.firebaseNavy,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                )),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: "btn1",
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BotScreen(
                              "assets/bots/megaagent-pain-c23504eb2943.json",
                              'AUC Personal Assistant - Multiple')));
                    },
                    backgroundColor: CustomColors.firebaseNavy,
                    foregroundColor: Colors.white,
                    child: const Icon(people),
                  ),
                  FloatingActionButton(
                    heroTag: "btn2",
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BotScreen(
                              "assets/bots/singleagent-hkng-1ac9cf4dc138.json",
                              'AUC Personal Assistant - Single')));
                    },
                    backgroundColor: CustomColors.firebaseNavy,
                    foregroundColor: Colors.white,
                    child: const Icon(person),
                  ),
                ])
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
                reserveChair(1, 2, 3, 44, 9009009);
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
