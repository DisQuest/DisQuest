import 'package:flutter/material.dart';

final primary = Colors.indigo;
final secondary = Colors.black;
final background = Colors.white10;

final List<Map> details = [
  {
    "name": "Abhi",
    "description":
        "A water fountain that is west of the washrooms and closer than you think.",
  },
  {
    "name": "Raj",
    "description":
        "Hardest to find among so many trees, but a beautiful sight.",
  },
  {
    "name": "Vikram",
    "description":
        "This little plant loves the sun, but this particular sunflower is located nort",
  },
  {
    "name": "Nick",
    "description": "This is that spot you go to for number 1 and 2",
  }
];

Widget userList(BuildContext context, int index) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10)),
      color: Colors.black12,
    ),
    width: double.infinity,
    height: 120,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/img-icon-0.jpg')))),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Text(
              //details[index]['name'],
              //style: TextStyle(
              //    color: primary, fontWeight: FontWeight.bold, fontSize: 18),
              //),
              SizedBox(
                height: 6,
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      details[index]['description'],
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.ltr,
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            width: 15,
            height: 15,
            margin: EdgeInsets.only(right: 0),
            child: Icon(Icons.arrow_right_outlined),
          ),
        ),
      ],
    ),
  );
}
