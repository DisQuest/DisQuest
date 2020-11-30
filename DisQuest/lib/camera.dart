//import 'package:DisQuest/cameraScreen.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'cameraScreen.dart';

List<CameraDescription> cameras;

Future<List> getCameras() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  return cameras;
}

class Camera extends StatelessWidget {
  String game_id;
  bool is_owner;
  String item_name;

  Camera({String game_id, bool is_owner, String item_name}){
    this.game_id = game_id;
    this.is_owner = is_owner;
    this.item_name = item_name;
  }

  static const description =
      "Line up the item up with the background picture before clicking the button";

  //hard coded
  //static const item_name = "Item #1";

  final cams = getCameras();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppBar(
            backgroundColor: new Color(0Xffef5350),
            title: Text(
              "Item check",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Text(
            item_name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),

           Expanded(
          child:CameraScreen(cameras, game_id, is_owner)
          ),

          Text(
            description,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
