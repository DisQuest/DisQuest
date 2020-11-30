import 'dart:convert';
//import 'dart:html';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:dio/dio.dart';

import 'package:DisQuest/signup.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
//import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:http/http.dart' as http;

class CameraScreen extends StatefulWidget {
  List<CameraDescription> cameras;
  String game_id;
  bool is_owner;

  CameraScreen(this.cameras, this.game_id, this.is_owner);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController controller;
  Future<void> _initializeControllerFuture;
  var isCameraReady = false;
  Image taken = null;
  String submit_path;

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
        submit_path = path; //.readAsBytesSync();
        /*.readAsBytes().then((onValue){
          submit_path = onValue;
          print("submit path is ");
          print(submit_path);
        });*/
      });
    } catch (e) {
      print(e);
    }
  }

  void retake() {
    setState(() {
      taken = null;
      submit_path = null;
    });
  }

  Future<bool> submitPic() async {
    //FormData formdata = FormData.fromMap({"file":"a"});
    //'../assets/images/img-icon-0.jpg

    FormData data = FormData.fromMap({
      "image1": await MultipartFile.fromFile(
        submit_path,
        filename: "img1.jpg",
      ),
      "image2": await MultipartFile.fromFile(
        submit_path,
        filename: "img2.jpg",
      )
    });

    Dio dio = new Dio();
    dio.options.headers["api-key"] = 'ccd798f4-cbfe-44e3-a5d1-8ac3fcaf97fa';
    //dio.options.headers['content-Type'] = 'application/json';

    return dio.post("https://api.deepai.org/api/image-similarity", data: data)

        /*
    http.MultipartFile data = await MultipartFile.fromPath("image", submit_path, filename: "image1.jpg");
    
    var request = http.MultipartRequest('POST', Uri.parse("https://api.deepai.org/api/image-similarity"));
    
    request.files.add(
      await MultipartFile.fromPath("image", submit_path, filename: "image1.jpg")
    );
    request.files.add(await MultipartFile.fromPath("image", submit_path, filename: "image1.jpg"));

    return await request.send()
    */

/*
    return await http
        .post("https://api.deepai.org/api/image-similarity",
            headers: <String, String>{
              'api-key': 'ccd798f4-cbfe-44e3-a5d1-8ac3fcaf97fa'
            },
            body: {data,data}
  */
        /*
            jsonEncode(<String, MultipartFile>{
              'image1.jpg': data,
              'image2.jpg': data,
            }
            */
        //        )
        .then((onValue) {
      return onValue.data["output"]["distance"] < 10;
    });
  }

  Widget background() {
    if (!widget.is_owner) {
      return Align(
        child: Opacity(
          child: Image.network(
            'https://9to5google.com/wp-content/uploads/sites/4/2019/10/pixel-4-camera-sample-portrait-2.jpg?quality=82&strip=all',
            alignment: new Alignment(0.0, 0.0),
          ),
          opacity: 0.2,
        ),
      );
    }
    return Container();
  }

  Widget getPreview(BuildContext context) {
    Widget preview;

    preview = FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          preview = Align(
            child: CameraPreview(controller),
            alignment: new Alignment(0.0, 0.0),
          );
          return preview;
        } else {
          // Otherwise, display a loading indicator.
          preview = Center(child: CircularProgressIndicator());
          return preview;
        }
      },
    );

    /*
    preview = 
              Align(
            child: CameraPreview(controller),
            alignment: new Alignment(0.0, 0.0),
          );
*/
    final renderObject = context?.findRenderObject();
    var translation = renderObject?.getTransformTo(null)?.getTranslation();
    var offset = null;
    if (translation != null && renderObject.paintBounds != null) {
      offset = Offset(translation.x, translation.y);
    }

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              preview,
              background(),
              ...(() {
                if (taken == null) {
                  return [
                    Positioned(
                        left: MediaQuery.of(context).size.width / 3,
                        bottom: MediaQuery.of(context).size.height / 30,
                        child: FloatingActionButton(
                            child: Icon(Icons.camera_alt),
                            // Provide an onPressed callback.
                            onPressed: onCaptureButtonPressed)),
                  ];
                } else {
                  return [
                    new Align(
                      child: taken,
                      alignment: new Alignment(0.0, 0.0),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 2,
                      bottom: MediaQuery.of(context).size.height / 30,
                      child: RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text("Submit"),
                        onPressed: () async {
                          bool correct;
                          await submitPic().then((onValue) {

                            correct = onValue;

                            print("correct is :");
                            print(onValue);
                            if (correct == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Material(child: SignUp())),
                              );
                            } else if (correct != null) {
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
                          });
                        },
                      ),
                    ),
                    Positioned(
                      right: MediaQuery.of(context).size.width / 2,
                      bottom: MediaQuery.of(context).size.height / 30,
                      child: RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Text("Retake"),
                          onPressed: retake),
                    )
                  ];
                }
              })(),
            ],
          ),
        )
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
