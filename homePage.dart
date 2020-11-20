import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
            RaisedButton(
              child: Text('Join a Game'),
              onPressed: () => print('Join a Game button pressed'),
            ),
            RaisedButton(
              child: Text('Sign Up'),
              onPressed: () => print('Sign Up burtton pressed'),
            ),
            RaisedButton(
              child: Text('Login'),
              onPressed: () => print('Login button pressed'),
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

