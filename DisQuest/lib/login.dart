import 'package:flutter/material.dart';
import './loggedInHomePage.dart';
import './flutterFire.dart';

class Login extends StatelessWidget {
  static const fields = [
    "Email",
    "Password",
  ];
  final controllers = [TextEditingController(), TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        AppBar(
          centerTitle: true,
          backgroundColor: new Color(0Xffef5350),
          title: Text(
            "Login",
            /*style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),*/
          ),
        ),
        Text(
          "DisQuest",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              ...fields.asMap().entries.map((entry) {
                return Container(
                  width: 200,

                  ///hard coded width
                  child: TextFormField(
                    controller: controllers[entry.key],
                    decoration:
                        InputDecoration(labelText: 'Enter your ' + entry.value),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                );
              }),
              Container(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  color: Color.fromRGBO(211, 196, 209, 100.0),
                  onPressed: () =>
                      login(controllers[0].text, controllers[1].text)
                          .then((hostId) => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      // Note: I switched this
                                      builder: (context) => Material(
                                              child: LoggedInHomePage(
                                            hostId: hostId,
                                          ))),
                                  // builder: (context) => Material(child: Camera())),
                                )
                              }),
                  child: Text(
                    "Login".toUpperCase(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
