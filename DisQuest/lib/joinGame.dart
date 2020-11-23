import 'package:flutter/material.dart';

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
            RaisedButton(
              child: Text('Join Game'),
              onPressed: () => print('Join Game button pressed'),
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
