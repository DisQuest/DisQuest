import 'package:flutter/material.dart';
import "./addCheckpoint.dart";

class JoinGame extends StatelessWidget {
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
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'User Name'),
            ),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Game Pin'),
            ),
            Container(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Color.fromRGBO(211, 196, 209, 100.0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Material(child: CheckPoints())),
                  );
                },
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
