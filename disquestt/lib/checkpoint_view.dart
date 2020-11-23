import 'package:disquestt/add_a_description.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CheckPoint extends StatefulWidget {
  CheckPoint({Key key}) : super(key: key);

  //final PickedFile img;

  @override
  State<StatefulWidget> createState() => _CheckPointState();
}

class _CheckPointState extends State<CheckPoint> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  @override
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
  String _uploadedFileURL;

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Checkpoint'),
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
                          children: <Widget>[
                            Padding(
                              padding: new EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Text(
                                'Description',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                border: Border.all(color: Colors.grey)),
                            constraints: BoxConstraints.expand(
                                height: size.height / 3.2, width: size.width),
                            child: Padding(
                              padding: new EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: SingleChildScrollView(
                                  child: Text(
                                'A water fountain that is west of the washrooms and closer than you think. A water fountain that is west of the washrooms and closer than you think. A water fountain that is west of the washrooms and closer than you think.A water fountain that is west of the washrooms and closer than you think.A water fountain that is west of the washrooms and closer than you think.A water fountain that is west of the washrooms and closer than you think.A water fountain that is west of the washrooms and closer than you think.A water fountain that is west of the washrooms and closer than you think.A water fountain that is west of the washrooms and closer than you think.A water fountain that is west of the washrooms and closer than you think.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 15),
                              )),
                            ),
                          )
                        ]),
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
                                                        new Text('hi'),
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
                              Container(
                                margin: EdgeInsets.only(left: 10, top: 10),
                                child: SizedBox(
                                  height: 50,
                                  width: size.width * 0.4,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    color: Color.fromRGBO(211, 196, 209, 100.0),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext bc) {
                                            return Container(
                                              child: new Wrap(
                                                children: <Widget>[
                                                  new Text('hi'),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    child: Text(
                                      "Hint".toUpperCase(),
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
