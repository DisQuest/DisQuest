import 'package:DisQuest/camera.dart';
import 'package:flutter/material.dart';
import './LoggedInHomePage.dart';

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
              
              ...fields.map((field){
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
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Submit"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        //builder: (context) => Material(child: LoggedInHomePage())),
                        builder: (context) => Material(child: Camera())),
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
