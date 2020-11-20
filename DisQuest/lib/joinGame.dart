import 'package:flutter/material.dart';

class JoinGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Join a Quest',
            textAlign: TextAlign.center,
          ),
        ),
        /*  body: Column(
          //this makes them to the side
          children: [
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
            RaisedButton(
              child: Text('Add a Checkpoint'),
              onPressed: () => print('Add a Checkpoint button pressed'),
            ),
            RaisedButton(
              child: Text('View Checkpoints'),
              onPressed: () => print('View Checkpoints button pressed'),
            ),
            RaisedButton(
              child: Text('Save Quest'),
              onPressed: () => print('Save Quest button pressed'),
            ),
          ],
        ),*/
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
        ),
      ),
    );
  }
}
