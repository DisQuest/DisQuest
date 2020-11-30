import 'package:flutter/material.dart';
import './createGame.dart';
import './joinGame_new.dart';
import './questsList.dart';
import './flutterFire.dart';

class LoggedInHomePage extends StatelessWidget {
  LoggedInHomePage({Key key, this.hostId}) : super(key: key);

  final String hostId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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

            /*Container(
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
                child: Text(
                  "Join a Game".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ),*/
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                //color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Material(child: JoinGameNew())),
                  );
                },
                color: Color.fromRGBO(211, 196, 209, 100.0),
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
            /* Container(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Color.fromRGBO(211, 196, 209, 100.0),
                onPressed: () => newGame(hostId).then((hostId) => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            // Note: I switched this
                            builder: (context) =>
                                Material(child: CreateGame())),
                      )
                    }),
                child: Text(
                  "Create a Game".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ),*/
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                //color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                onPressed: () => newGame(hostId).then((hostId) => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            // Note: I switched this
                            builder: (context) =>
                                Material(child: CreateGame())),
                      )
                    }),
                color: Color.fromRGBO(211, 196, 209, 100.0),
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
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                //color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Material(child: QuestsList())),
                  );
                },
                color: Color.fromRGBO(211, 196, 209, 100.0),
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
