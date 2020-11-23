import 'package:DisQuest/camera.dart';
import 'package:flutter/material.dart';
import './loggedInHomePage.dart';
import './flutterFireTest.dart';

class SignUp extends StatelessWidget {
  static const fields = [
    "Username",
    "Email",
    "Password",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        AppBar(
          centerTitle: true,
          backgroundColor: new Color(0Xffef5350),
          title: Text(
            "Sign Up",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
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
              ...fields.map((field) {
                return Container(
                  width: 200,

                  ///hard coded width

                  child: TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Enter your ' + field),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                );
              }),
              RaisedButton(
                child: Text("Sign Up"),
                onPressed: () => addHost("username").then((hostId) => {
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
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
