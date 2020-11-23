import 'package:flutter/material.dart';

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
            Container(
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
            ),
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
                  RaisedButton(
                    child: Text('Add a Checkpoint'),
                    onPressed: () => print('Add a Checkpoint button pressed'),
                  ),
                  RaisedButton(
                    child: Text('View Checkpoints'),
                    onPressed: () => print('View Checkpoints button pressed'),
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Save Quest'),
              onPressed: () => print('Save Quest button pressed'),
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
