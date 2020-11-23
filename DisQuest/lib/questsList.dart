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
            body: Column(
              children: [
                Card(
                    child: Row(
                  children: [
                    Container(
                        child: Column(
                      children: [
                        Text(
                          'Quest #',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'View Quest',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          /*color: const Color(0xFFb3E5fc), size: 48.0*/
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ))
              ],
            )));
  }
}
