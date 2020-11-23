import 'package:flutter/material.dart';
import './LoggedInHomePage.dart';

class Login extends StatelessWidget {
  static const fields = [
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
              ...fields.map((field) {
                return Row(children: [
                  Text(
                    field + ":",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
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
                  ),
                ]);
              }),
              RaisedButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Material(child: LoggedInHomePage())),
                  );
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
