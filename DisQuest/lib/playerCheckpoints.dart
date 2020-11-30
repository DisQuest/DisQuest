import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './userList.dart';
import "./flutterFire.dart";
import "./checkpoint.dart";

class PlayerCheckPoints extends StatefulWidget {
  PlayerCheckPoints({Key key, this.hostId, this.gameId}) : super(key: key);
  final String hostId;
  final String gameId;

  @override
  State<StatefulWidget> createState() => _PlayerCheckPoints();
}

class _PlayerCheckPoints extends State<PlayerCheckPoints> {
  List<DocumentSnapshot> details = [];

  @override
  void initState() {
    super.initState();
    print("host id"+widget.hostId);
    print("host id"+widget.gameId);
    getCheckpoints(widget.hostId, widget.gameId).then((checkpoints) {
      details = checkpoints;
      print(details);
      print('no');
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: new Color(0Xffef5350),
        title: Text(
          'Checkpoints',
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
                          child: userList(context, index, details, ''),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckPoint(
                                      hostId: widget.hostId,
                                      gameId: widget.gameId,
                                      checkpoint: details[index]
                                          .documentID), //Need to identify the particular checkpoint that we are displaying
                                ));
                          },
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
