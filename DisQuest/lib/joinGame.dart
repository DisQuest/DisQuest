import 'package:flutter/material.dart';
import "./hostCheckpoints.dart";
import 'flutterFire.dart';

class JoinGame extends StatelessWidget {
  final usernameController = TextEditingController();
  final pinController = TextEditingController();
  JoinGame({Key key, this.hostId, this.gameId}) : super(key: key);
  final String hostId;
  final String gameId;
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
                    getCurrentGame(pinController).then((gameDocument) {
                  print(gameDocument.documentID);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // Note: I switched this
                          builder: (context) => Material(
                              child: HostCheckPoints(
                                  hostId: pinController.text,
                                  gameId: gameDocument.documentID))));
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
