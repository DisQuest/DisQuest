//import 'package:DisQuest/cameraScreen.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'cameraScreen.dart';

CameraDescription cameras;

 Future<CameraDescription> getCameras() async {
  WidgetsFlutterBinding.ensureInitialized();
  return await availableCameras().then((onValue){
    cameras = onValue.first;
    return cameras;
  });
}

class Camera extends StatelessWidget {
  String game_id;
  String owner_id;
  String checkpoint;

  Camera({String game_id, String owner_id, String checkpoint}){
    this.game_id = game_id;
    this.owner_id = owner_id;
    this.checkpoint = "Item #"+checkpoint;
    print(game_id+" "+owner_id+checkpoint);
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
            checkpoint,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),

           Expanded(
          child:CameraScreen(cameras, game_id, owner_id, checkpoint)
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
