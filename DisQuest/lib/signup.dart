//import 'package:DisQuest/camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './loggedInHomePage.dart';
import './flutterFire.dart';

class SignUp extends StatelessWidget {
  static const fields = [
    "Username",
    "Email",
  ];

  final controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  final PASSWORD_CONTROLLER = 2;

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
                width: 200,

                ///hard coded width

                child: TextFormField(
                  controller: controllers[PASSWORD_CONTROLLER],
                  decoration: InputDecoration(labelText: 'Enter your password'),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Color.fromRGBO(211, 196, 209, 100.0),
                onPressed: () {
                  if (controllers[0].text == "" ||
                      controllers[0].text == "" ||
                      controllers[0].text == "") {
                    Fluttertoast.showToast(
                        msg:
                            'Please Enter in valid usernames, emails, and passwords',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIos: 5,
                        backgroundColor: Colors.red,
                        textColor: Colors.black);
                  } else {
                    addHost(controllers[0].text, controllers[1].text,
                            controllers[2].text)
                        .then((hostId) => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Material(child: LoggedInHomePage())),
                              )
                            });
                  }
                },
                child: Text(
                  "Sign Up".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
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
