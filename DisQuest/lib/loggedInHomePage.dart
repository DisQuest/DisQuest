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
              padding: EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  Column(children: [
                    IconButton(
                      icon: Icon(Icons.account_circle,
                          color: const Color(0xFFb3E5fc), size: 48.0),
                      tooltip: 'My Account',
                      onPressed: () {},
                    ),
                  ]),
                  Spacer(),
                  Column(children: [
                    IconButton(
                      icon: Icon(Icons.settings_rounded,
                          color: const Color(0xFFb3E5fc), size: 48.0),
                      tooltip: 'Settings',
                      onPressed: () {},
                    ),
                  ]),
                ],
              ),
            ),
            /*RaisedButton(
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
            ),*/
            Container(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Color.fromRGBO(211, 196, 209, 100.0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Material(child: JoinGame())),
                  );
                },
                /* showModalBottomSheet(
                      context: context,
                      builder: (BuildContext bc) {
                        return Container(
                          child: new Wrap(
                            children: <Widget>[
                              new Text('hi'),
                            ],
                          ),
                        );
                      });*/

                child: Text(
                  "Join a Game".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
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
                        builder: (context) => Material(child: CreateGame())),
                  );
                },
                child: Text(
                  "Create a Game".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
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
                        builder: (context) => Material(child: QuestsList())),
                  );
                },
                child: Text(
                  "Your Quests".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(bottom: 15, right: 15),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  color: Color.fromRGBO(211, 196, 209, 100.0),
                  icon: Icon(Icons.help_outline_rounded,
                      color: Colors.lightBlue, size: 48.0),
                  tooltip: 'Help',
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
        /*bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
        ),*/
      ),
    );
  }
}
