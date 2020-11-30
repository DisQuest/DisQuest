import 'package:DisQuest/flutterFire.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './loggedInHomePage.dart';
import './signup_new.dart';

class LoginNew extends StatelessWidget {
  final password = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: new Color(0Xffef5350),
          title: Text(
            'Login',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  //color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  // onChanged: onChanged,
                  //cursorColor: kPrimaryColor,
                  controller: email,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      //color: kPrimaryColor,
                    ),
                    hintText: "Your Email",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  //color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  obscureText: true,
                  // onChanged: onChanged,
                  //  cursorColor: kPrimaryColor,
                  controller: password,
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: Icon(
                      Icons.lock,
                      //   color: kPrimaryColor,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      // color: kPrimaryColor,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  //color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  onPressed: () => login(email.text,
                          password.text) // username, password
                      .then((hostId) {
                    if (hostId != null && !(hostId is Exception)) {
                      Fluttertoast.showToast(
                          msg: 'Successfully Logged In',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIos: 5,
                          backgroundColor: Colors.green,
                          textColor: Colors.black);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            // Note: I switched this
                            builder: (context) => Material(
                                    child: LoggedInHomePage(
                                  hostId: hostId,
                                ))),
                        // builder: (context) => Material(child: Camera())),
                      );
                    } else {
                      String msg = '';
                      if (hostId is AuthException ||
                          hostId is PlatformException) {
                        msg = hostId.message;
                      } else if (hostId is Exception) {
                        msg = msg.toString();
                      } else {
                        msg = hostId;
                      }
                      Fluttertoast.showToast(
                          msg: msg,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIos: 5,
                          backgroundColor: Colors.red,
                          textColor: Colors.black);
                    }
                  }),,
                  color: Color.fromRGBO(211, 196, 209, 100.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an Account? ",
                    //style: TextStyle(color: kPrimaryColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SignUpNew(), //Need to identify the particular checkpoint that we are displaying
                          ));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
