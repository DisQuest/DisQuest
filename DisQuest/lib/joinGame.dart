import 'package:flutter/material.dart';
<<<<<<< HEAD
import "./addCheckpoint.dart";
=======
import 'flutterFire.dart';
import './questsList.dart';
>>>>>>> firebase_setup

class JoinGame extends StatelessWidget {
  final usernameController = TextEditingController();
  final pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: new Color(0Xffef5350),
          title: Text(
            'Join a Quest',
          ),
        ),
        body: Column(
          //this makes them to the side
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'User Name'),
            ),
            TextField(
              controller: pinController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Game Pin'),
            ),
            Container(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Color.fromRGBO(211, 196, 209, 100.0),
                onPressed: () =>
                    getCurrentGame(pinController).then((gameId) => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // Note: I switched this
                                  builder: (context) => Material(
                                      child: QuestsList(
                                          hostId: pinController.text,
                                          gameId: gameId)))),
                        }),
                child: Text(
                  "Join Game".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
        ),
      ),
    );
  }
}
