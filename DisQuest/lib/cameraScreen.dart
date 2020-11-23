import 'dart:io';
import 'dart:ui';

import 'package:DisQuest/signup.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CameraScreen extends StatefulWidget {
  List<CameraDescription> cameras;

  CameraScreen(this.cameras);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController controller;
  Future<void> _initializeControllerFuture;
  var isCameraReady = false;
  Image taken = null;

  @override
  initState() {
    super.initState();
    controller =
        new CameraController(widget.cameras.first, ResolutionPreset.high);
    _initializeControllerFuture = controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        isCameraReady = true;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      controller != null
          ? _initializeControllerFuture = controller.initialize()
          : null; //on pause camera is disposed, so we need to call again "issue is only for android"
    }
  }

  void onCaptureButtonPressed() async {
    //on camera button press
    try {
      final path = join(
        (await getTemporaryDirectory()).path, //Temporary path
        '${DateTime.now()}.png',
      );

      await controller.takePicture(path); //take photo

      setState(() {
        taken = Image.file(File(path));
      });
    } catch (e) {
      print(e);
    }
  }

  void retake() {
    setState(() {
      taken = null;
    });
  }

  bool submitPic() {
    //check if right pic

    //take back to checkpoints if right & mark checkpoint as done

    //else tell wrong and retake

    return false;
  }

  Widget getPreview(BuildContext context) {
    Widget preview = new Expanded(
        child: Align(
      child: CameraPreview(controller),
      alignment: new Alignment(0.0, 0.0),
    ));

    final renderObject = context?.findRenderObject();
    var translation = renderObject?.getTransformTo(null)?.getTranslation();
    var offset = null;
    if (translation != null && renderObject.paintBounds != null) {
      offset = Offset(translation.x, translation.y);
    }

    return Column(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Container(
            color: Colors.black.withOpacity(0.0),
          ),
        ),
        ...(() {
          if (taken == null) {
            return [
              preview,
              FloatingActionButton(
                  child: Icon(Icons.camera_alt),
                  // Provide an onPressed callback.
                  onPressed: onCaptureButtonPressed)
            ];
          } else {
            return [
              new Expanded(
                  child: Align(
                child: taken,
                alignment: new Alignment(0.0, 0.0),
              )),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Submit"),
                onPressed: () {
                  if (submitPic()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Material(child: SignUp())),
                    );
                  } else {
                    //show a popup
                    //retake();
                    Fluttertoast.showToast(
                        msg: 'Incorrect Image, Please try again',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIos: 5,
                        backgroundColor: Colors.red,
                        textColor: Colors.black);
                  }
                },
              ),
              RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Retake"),
                  onPressed: retake),
            ];
          }
        })(),

        /*
    Align(child: 
    Opacity(child: 
    Image.network('https://9to5google.com/wp-content/uploads/sites/4/2019/10/pixel-4-camera-sample-portrait-2.jpg?quality=82&strip=all',
        alignment: new Alignment(0.0,0.0),
        ),
        opacity: 0.2,
    ),   
    ),
    */
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }

    return new AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: getPreview(context),
    );
  }
}
