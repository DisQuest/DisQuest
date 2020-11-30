import 'package:flutter/material.dart';
import 'flutterFire.dart';
//import './questsList.dart';
import './playerCheckpoints.dart';

class JoinGameNew extends StatelessWidget {
  final usernameController = TextEditingController();
  final pinController = TextEditingController();
  JoinGameNew({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: new Color(0Xffef5350),
          title: Text(
            'Join a Quest',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  //color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  // onChanged: onChanged,
                  //cursorColor: kPrimaryColor,
                  controller: usernameController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      //color: kPrimaryColor,
                    ),
                    hintText: "Your Email",
                    border: InputBorder.none,
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
                child: TextField(
                  // onChanged: onChanged,
                  //cursorColor: kPrimaryColor,
                  controller: pinController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock_open,
                      //color: kPrimaryColor,
                    ),
                    hintText: "Game Pin",
                    border: InputBorder.none,
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
                    joinGame(pinController.text, usernameController.text)
                        .then((hostGame) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Material(
                                child: PlayerCheckPoints(
                                    hostId: hostGame[0], gameId: hostGame[1]))),
                      );
                    });
                  },
                  color: Color.fromRGBO(211, 196, 209, 100.0),
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
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
        ),
      ),
    );
  }
}
