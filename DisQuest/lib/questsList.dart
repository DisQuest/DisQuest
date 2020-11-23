import 'package:flutter/material.dart';

class QuestsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: new Color(0Xffef5350),
          title: Text(
            'Your Quests',
          ),
        ),
        body: Container(
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.account_circle,
                    color: const Color(0xFF000000), size: 48.0),
                tooltip: 'My Account',
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.account_circle,
                    color: const Color(0xFF000000), size: 48.0),
                tooltip: 'My Account',
                onPressed: () {},
              ),
            ],
          ),

          //this makes them to the side
        ),
      ),
    );
  }
}
