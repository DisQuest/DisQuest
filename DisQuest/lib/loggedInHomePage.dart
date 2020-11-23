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
          centerTitle: true,
          backgroundColor: new Color(0Xffef5350),
          title: Text(
            'DisQuest',
          ),
        ),
        body: Column(
          //this makes them to the side
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.account_circle,
                        color: const Color(0xFFb3E5fc), size: 48.0),
                    tooltip: 'My Account',
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.settings_rounded,
                        color: const Color(0xFFb3E5fc), size: 48.0),
                    tooltip: 'Settings',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Join a Game'),
              // color: const Color(0xffe),
              textColor: const Color(0xFFb3E5fc),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 2)),
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
            Container(
                child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.help_outline_rounded,
                    color: const Color(0xFF000000), size: 48.0),
                tooltip: 'Help',
                onPressed: () {},
              ),
            ))
          ],
        ),
        /*bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
        ),*/
      ),
    );
  }
}
