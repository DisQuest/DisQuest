import 'package:flutter/material.dart';
import "./addCheckpoint.dart";

class CreateGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: new Color(0Xffef5350),
          title: Text(
            'Create a Quest',
          ),
        ),
        body: Column(
          //this makes them to the side
          children: [
            /*Container(
              child: Row(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Hours'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Min'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Sec'),
                  ),
                ],
              ),
            ),*/
            TextField(
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Hours'),
            ),
            TextField(
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Min'),
            ),
            TextField(
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Sec'),
            ),
            Container(
              child: Row(
                children: [
                  Container(
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
                        "Add a Checkpoint".toUpperCase(),
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
                      onPressed: () {},
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
                ],
              ),
            ),
            Container(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Color.fromRGBO(211, 196, 209, 100.0),
                onPressed: () {},
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
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
        ),
      ),
    );
  }
}
