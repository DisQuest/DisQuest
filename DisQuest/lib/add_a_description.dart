import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddDescription extends StatefulWidget {
  AddDescription({Key key, this.img, this.hint}) : super(key: key);

  final PickedFile img;
  final String hint;

  @override
  State<StatefulWidget> createState() => _AddDescriptionState();
}

class _AddDescriptionState extends State<AddDescription> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    Size size = MediaQuery.of(context).size;
    String description = "";
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Add a Hint'),
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
                            Container(
                              padding: const EdgeInsets.all(20),
                              constraints: BoxConstraints.expand(
                                  height: size.height / 3, width: size.width),
                              child: TextField(
                                controller: myController,
                                minLines: null,
                                maxLines: null,
                                expands: true,
                                textAlign: TextAlign.left,
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    hintText:
                                        'Enter a description for this checkpoint'),
                              ),
                            ),
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
                            Text('3/3',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // Upload Button
                            children: <Widget>[
                              // Clear Button
                              Container(
                                margin: EdgeInsets.only(right: 30, top: 10),
                                child: SizedBox(
                                  height: 50,
                                  width: size.width * 0.4,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    color: Color.fromRGBO(211, 196, 209, 100.0),
                                    onPressed: () {
                                      description = myController.text; // description
                                      print(widget.img); // img
                                      print(widget.hint); // hint
                                      // POST : 
                                      // parameters: (description, hint, image)
                                      // TODO: Firebase insert into document
                                      // A constants file that keeps track of user and/or game profile information
                                    },
                                    child: Text(
                                      "Finish".toUpperCase(),
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
