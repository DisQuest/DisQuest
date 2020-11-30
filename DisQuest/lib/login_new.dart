import 'package:flutter/material.dart';
import './loggedInHomePage.dart';

class LoginNew extends StatelessWidget {
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
              /*Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),*/
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
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      //color: kPrimaryColor,
                    ),
                    hintText: "Your Username",
                    border: InputBorder.none,
                  ),
                ),
              ),
              /*Container(
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
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      //color: kPrimaryColor,
                    ),
                    hintText: "Your Email",
                    border: InputBorder.none,
                  ),
                ),
              ),*/
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Material(child: LoggedInHomePage())),
                    );
                  },
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
            ],
          ),
        ),
      ),
    );
  }
}
