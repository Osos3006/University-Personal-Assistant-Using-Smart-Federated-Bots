/*  this file represents the class bot screen that is used to instantiate a 
screen for bots conversation. the type bot that is instantiated depends on 
the json file that is passed from the BotWelcome.dart Class. the json files 
represents the keys that are used to connect the agents with Google Dialogflow

for the single agent:  assets\bots\singleagent-hkng-1ac9cf4dc138.json
for the bot federation: assets\bots\megaagent-pain-c23504eb2943.json
*/

import 'package:flutter/material.dart';
import 'package:thesis/res/custom_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thesis/screens/user_info_screen.dart';
import 'package:thesis/utils/authentication.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:bubble/bubble.dart';

class BotScreen extends StatefulWidget {
  String fileName;
  String barName;
  BotScreen(this.fileName, this.barName);
  @override
  _BotScreen createState() => _BotScreen(this.fileName, this.barName);
}

class _BotScreen extends State<BotScreen> {
  void response(query) async {
    

    // authenticating the google project using the provided keys. 
    AuthGoogle authGoogle = await AuthGoogle(fileJson: this.fileName).build();

    // starting dialogflow with the correct authetication and language
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);


    // Getting the response from Dialogflow API by sending the query, detecting
    // the intent and getting a response back. 
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    


    // formatting the response in the messages dictionary, in order to render it 
    // back correctly to the user. 
    setState(() {
      messages.insert(0, {
        "data": 0, // 0 for chatbot messages
        "message": aiResponse.getListMessage().last["text"]["text"][0]
      });
    });
  }

  final messageInsert = TextEditingController();
  List<Map> messages = [];
  String fileName;
  String barName;
  _BotScreen(this.fileName, this.barName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('${this.barName}'),
        backgroundColor: CustomColors.firebaseNavy,
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  padding: EdgeInsets.all(10.0),
                  itemBuilder: (context, index) => chat(
                      messages[index]["message"].toString(),
                      messages[index]["data"]))),
          Divider(
            height: 3.0,
            color: Colors.grey[500],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Flexible(
                    child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: messageInsert,
                  decoration: InputDecoration.collapsed(
                      hintText: "send your message",
                      hintStyle: TextStyle(color: Colors.grey[500])),
                )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      if (messageInsert.text.isEmpty) {
                        print("empty message");
                      } else {
                        setState(() {
                          messages.insert(0, {
                            "data": 1,
                            "message": messageInsert.text
                          }); // 1 for user messages
                        });
                        response(messageInsert.text);
                        messageInsert.clear();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  //for better one i have use the bubble package check out the pubspec.yaml
  // a widget for rendering the responses back to the user built on the bubble 
  // package
  Widget chat(String message, int data) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Bubble(
          radius: Radius.circular(15.0),
          color: data == 0 ? Colors.blue[400] : Colors.blue[200],
          elevation: 0.0,
          alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
          nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(data == 0
                      ? "assets/bot_logo.png"
                      : "assets/user_logo.png"),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                    child: Text(
                  message,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
              ],
            ),
          )),
    );
  }
}
