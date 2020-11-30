import 'package:flutter/material.dart';
import "./addCheckpoint.dart";
import './loggedInHomePage.dart';
import 'package:numberpicker/numberpicker.dart';

class CreateGame extends StatefulWidget {
  CreateGame({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateGame();
}

class _CreateGame extends State<CreateGame> {
  int hour = 0;
  int min = 0;
  int sec = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: new Color(0Xffef5350),
        title: Text(
          'Quest Settings',
        ),
      ),
      body: Center(
        child:
            //children: [
            Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Quest Name'),
                ),
              ),
              Container(
                  //  flex: 6,
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text(
                          "HH",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                      ),
                      NumberPicker.integer(
                        initialValue: hour,
                        minValue: 0,
                        maxValue: 23,
                        listViewWidth: 60.0,
                        onChanged: (val) {
                          setState(() {
                            hour = val;
                          });
                        },
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text(
                          "MM",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                      ),
                      NumberPicker.integer(
                        initialValue: min,
                        minValue: 0,
                        maxValue: 59,
                        listViewWidth: 60.0,
                        onChanged: (val) {
                          setState(() {
                            min = val;
                          });
                        },
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text(
                          "SS",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                      ),
                      NumberPicker.integer(
                        initialValue: sec,
                        minValue: 0,
                        maxValue: 60,
                        listViewWidth: 60.0,
                        onChanged: (val) {
                          setState(() {
                            sec = val;
                          });
                        },
                      )
                    ],
                  )
                ],
              )),
              Container(
                //   flex: 1,
                child: Container(
                  child: Container(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      color: Color.fromRGBO(211, 196, 209, 100.0),
                      onPressed: () {},
                      child: Text(
                        "Add a Checkpoint".toUpperCase(),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                //  flex: 3,
                child: Container(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    color: Color.fromRGBO(211, 196, 209, 100.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Material(child: CheckPoints())),
                      );
                    },
                    child: Text(
                      "View Checkpoints".toUpperCase(),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Game Pin'),
                ),
              ),
              Container(
                child: Container(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    color: Color.fromRGBO(211, 196, 209, 100.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Material(child: LoggedInHomePage())),
                      );
                    },
                    child: Text(
                      "Save Quest".toUpperCase(),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        /*  bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
        ),*/
      ),
    ));
  }
}
