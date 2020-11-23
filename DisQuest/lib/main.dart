import 'package:flutter/material.dart';
import './signup.dart';
import './joinGame.dart';
import './login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DisQuest',
      theme: ThemeData(
        primaryColor: new Color(0Xffef5350),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'DisQuest'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'DisQuest',
        ),
      ),
      body: Column(
        //this makes them to the side
        children: [
          RaisedButton(
            child: Text('Join a Game'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Material(child: JoinGame())),
              );
            },
          ),
          RaisedButton(
            child: Text('Sign Up'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Material(child: SignUp())),
              );
            },
          ),
          RaisedButton(
            child: Text('Login'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Material(child: Login())),
              );
            },
          ),
          Container(
              child: Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(Icons.help_outline_rounded,
                  color: const Color(0xFF000000), size: 48.0),
              tooltip: 'Help',
              onPressed: () {},
            ),
          ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
