import 'package:DisQuest/addCheckpointImage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './userList.dart';
import "./flutterFire.dart";

class HostCheckPoints extends StatefulWidget {
  HostCheckPoints({Key key, this.hostId, this.gameId}) : super(key: key);
  final String hostId;
  final String gameId;

  @override
  State<StatefulWidget> createState() => _HostCheckPoints();
}

class _HostCheckPoints extends State<HostCheckPoints> {
  List<DocumentSnapshot> details = [];

  @override
  void initState() {
    super.initState();
    getCheckpoints(widget.hostId, widget.gameId).then((checkpoints) {
      // "KNeTAnW1Pas64smQjK7O", "12345"
      details = checkpoints;
      print(details);
      print('no');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // To get the image from firestore, call getCheckpoint()
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
                        final current = details[index];
                        return FutureBuilder<String>(
                            future: getFile('/' + current.data['item_image'])
                                .then((url) => url.toString()),
                            builder: (context, snapshot) {
                              return GestureDetector(
                                child: userList(
                                    context, index, details, snapshot.data),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddCheckpointImage(
                                            hostId: widget.hostId,
                                            gameId: widget
                                                .gameId), //Need to identify the particular checkpoint that we are displaying
                                      ));
                                },
                              );
                            });
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
