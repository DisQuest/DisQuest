import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'dart:io';
import './add_a_hint.dart';
import 'camera.dart';

class AddCheckpointImage extends StatefulWidget {
  AddCheckpointImage({Key key, this.hostId, this.gameId}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String hostId;
  final String gameId;

  @override
  _AddCheckpointImageState createState() => _AddCheckpointImageState();
}

class _AddCheckpointImageState extends State<AddCheckpointImage> {
  var buttons = ButtonBar(
    children: <Widget>[
      FlatButton(
        child: Text('Ok'),
        color: Colors.blue,
        onPressed: () {/** */},
      ),
      FlatButton(
        child: Text('Cancel'),
        color: Colors.blue,
        onPressed: () {/** */},
      ),
    ],
  );

  PickedFile _image;

  Future chooseFile() async {
    ImagePicker img = new ImagePicker();
    await img.getImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  Future clearSelection() async {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the AddCheckpointImage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Add Checkpoint"),
        backgroundColor: new Color(0Xffef5350),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            _image != null
                                ? Container(
                                    constraints: BoxConstraints.expand(
                                        height: size.height / 3,
                                        width: size.width),
                                    child: Image.file(File(_image.path),
                                        fit: BoxFit.cover),
                                  )
                                : Container(
                                    constraints: BoxConstraints.expand(
                                        height: size.height / 3,
                                        width: size.width),
                                    child: Image.asset(
                                        "assets/images/img-icon-0.jpg",
                                        fit: BoxFit.cover),
                                  )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              constraints: BoxConstraints.expand(
                                  height: size.height / 2.8, width: size.width),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('1/3',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // Upload Button
                            children: <Widget>[
                              _image == null
                                  ? Container(
                                      margin:
                                          EdgeInsets.only(right: 10, top: 10),
                                      child: SizedBox(
                                        height: 50,
                                        width: size.width * 0.4,
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18)),
                                          color: Color.fromRGBO(
                                              211, 196, 209, 100.0),
                                          onPressed: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (BuildContext bc) {
                                                  return Container(
                                                    child: new Wrap(
                                                      children: <Widget>[
                                                        new ListTile(
                                                            leading: new Icon(
                                                                Icons.camera),
                                                            title: new Text(
                                                                'Camera'),
                                                            onTap: () =>
                                                                {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                Camera(
                                                                          game_id:
                                                                              widget.gameId,
                                                                          owner_id:
                                                                              widget.hostId,
                                                                          checkpoint:
                                                                              "1",
                                                                        ), //Need to identify the particular checkpoint that we are displaying
                                                                      ))
                                                                }), // TODO: Connect with Pratyank
                                                        new ListTile(
                                                          leading: new Icon(
                                                              Icons.photo),
                                                          title: new Text(
                                                              'Gallery'),
                                                          onTap: () => {
                                                            Navigator.pop(
                                                                context),
                                                            chooseFile()
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Text(
                                            "Upload".toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.lightBlue,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  :
                                  // Clear Button
                                  Container(
                                      margin:
                                          EdgeInsets.only(right: 10, top: 10),
                                      child: SizedBox(
                                        height: 50,
                                        width: size.width * 0.4,
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18)),
                                          color: Color.fromRGBO(
                                              211, 196, 209, 100.0),
                                          onPressed: clearSelection,
                                          child: Text(
                                            "Clear Image".toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.lightBlue,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                              _image == null
                                  ? Container(
                                      // // Next Button when no image
                                      margin:
                                          EdgeInsets.only(left: 10, top: 10),
                                      child: SizedBox(
                                        height: 50,
                                        width: size.width * 0.4,
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18)),
                                          color: Color.fromRGBO(
                                              211, 196, 209, 200.0),
                                          onPressed: () {},
                                          child: Text(
                                            "Next".toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  86, 203, 249, 200.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      margin:
                                          EdgeInsets.only(left: 10, top: 10),
                                      child: SizedBox(
                                        height: 50,
                                        width: size.width * 0.4,
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18)),
                                          color: Color.fromRGBO(
                                              211, 196, 209, 100.0),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => AddHint(
                                                    img: this._image,
                                                    hostId: widget.hostId,
                                                    gameId: widget.gameId,
                                                  ),
                                                ));
                                          },
                                          child: Text(
                                            "Next".toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.lightBlue,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
