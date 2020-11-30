//import 'package:DisQuest/camera.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './loggedInHomePage.dart';
import './flutterFire.dart';

class SignUp extends StatelessWidget {
  static const fields = [
    "Username",
    "Email",
    "Password",
  ];

  final controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
                Container(
                    width: 200,
                    child: Row(children: [
                      TextField(
                        // controller: controllers[entry.key],
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.person, /*color: kPrimaryColor,*/
                            ),
                            hintText: 'Your Username',
                            border: InputBorder.none),
                      ),
                      TextField(
                        // controller: controllers[entry.key],
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            icon: Icon(
                              Icons.lock, /*color: kPrimaryColor,*/
                            ),
                            suffixIcon: Icon(
                              Icons.visibility, /*color: kPrimaryColor,*/
                            ),
                            border: InputBorder.none),
                      )
                    ])

                    /*  validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;*/
                    ),
              ],
            ),
            /* children: [
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Color.fromRGBO(211, 196, 209, 100.0),
                onPressed: () => addHost(controllers[0].text,
                        controllers[1].text, controllers[2].text)
                    .then((hostId) => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Material(child: LoggedInHomePage())),
                          )
                        }),
                child: Text(
                  "Sign Up".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ],*/
          ),
        ],
      ),
    );
  }
}

/* ...fields.asMap().entries.map((entry) {
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
              }),*/
