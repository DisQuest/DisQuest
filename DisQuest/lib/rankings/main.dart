import 'package:flutter/material.dart';

import "./quiz.dart";

// To re-format the document ctrl+shift+I
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // This is like the "Parent widget" for all of the widgets in my application
  // because this is the widget that is passed into the runApp() function
  var _qI = 0;
  static const qA = [
    {
      "question": 'What\'s your favourite colour?',
      'answers': ['Green', 'Blue', 'Black', 'Red']
    },
    {
      'question': 'What\'s your favourite animal?',
      'answers': ['Donkey', 'Lion', "Baboon", "Elephant"]
    },
  ];

  void _answerQuestion() {
    if (_qI < qA.length) {
      setState(() {
        _qI++;
      });
    }
    print('Answer chosen!');
  }

  void restart() {
    setState(() {
      _qI = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("My First App"),
      ),
      body: _qI < qA.length
          ? Quiz(answer: _answerQuestion, questions: qA, qI: _qI)
          : Container(
              width: double.infinity,
              child: Column(children: [
                Text("Thank you for answering the questions"),
                RaisedButton(
                  child: Text("Click here to restart the quiz"),
                  onPressed: restart,
                  color: Colors.green,
                  textColor: Colors.white,
                ),
              ]),
            ),
    ));
  }
}
