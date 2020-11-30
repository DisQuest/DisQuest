import 'package:DisQuest/createGame.dart';
import 'package:DisQuest/questCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuestsList extends StatefulWidget {
  QuestsList({Key key, this.hostId, this.gameId}) : super(key: key);
  final String hostId;
  final String gameId;

  @override
  State<StatefulWidget> createState() => _QuestsList();
}

class _QuestsList extends State<QuestsList> {
  // List<DocumentSnapshot> details = [];

//need to get the quests instead
  /*@override
  void initState() {
    super.initState();
    getCheckpoints("KNeTAnW1Pas64smQjK7O", "12345").then((checkpoints) {
      details = checkpoints;
      print(details);
      print(details[0]);
      print('no');
      setState(() {});
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: new Color(0Xffef5350),
        title: Text(
          'Your Quests',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 25),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: details.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: questCard(context, index, details),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateGame(),
                                  //Need to identify the particular checkpoint that we are displaying
                                ));
                          },
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
