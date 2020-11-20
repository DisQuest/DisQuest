import 'package:flutter/material.dart';
import './createGame.dart';
import './joinGame.dart';
import './questsList.dart';

class LoggedInHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'DisQuest',
            textAlign: TextAlign.center,
          ),
        ),
        body: Column(
          //this makes them to the side
          children: [
            new Icon(Icons.person, color: const Color(0xFF000000), size: 48.0),
            new Icon(Icons.settings,
                color: const Color(0xFF000000), size: 48.0),
            RaisedButton(
              child: Text('Join a Game'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Material(child: JoinGame())),
                );
              },
            ),
            RaisedButton(
              child: Text('Create a Game'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Material(child: CreateGame())),
                );
              },
            ),
            RaisedButton(
              child: Text('Your Quests'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Material(child: QuestsList())),
                );
              },
            ),
            RaisedButton(
              child: Text('Help'),
              onPressed: () => print('Help button pressed'),
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
