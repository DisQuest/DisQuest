import 'package:disquestt/add_a_hint.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'dart:io';

import 'checkpoint_view.dart';
import 'userList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MyHomePage(title: 'DisQuest'),
      //home: CheckPoints(),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('hi')]),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('hi')]),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              padding: EdgeInsets.only(right: 15, bottom: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text('hi')]))
        ],
      ),
    ]));
  }
}

class CheckPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        child: userList(context, index),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckPoint(),
                              ));
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
        title: Text(widget.title),
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
                                                                {}), // TODO: Connect with Pratyank
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
                                                  builder: (context) =>
                                                      AddHint(img: this._image),
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
