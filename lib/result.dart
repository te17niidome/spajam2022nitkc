import 'dart:io';
import 'dart:math' as math;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_spajam2022/home.dart';
import 'package:flutter_application_spajam2022/take_picture1.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:ui' as ui;

// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'face_detec.dart';
// import 'package:flutter_application_spajam2022/judge.dart';

class Result extends StatelessWidget {
  var image_win;
  // 判定部分
  void judgement() {
    var random = math.Random();
    double saikoro = random.nextDouble();
    FaceDetector player1 = FaceDetector();
    FaceDetector player2 = FaceDetector();
    double image_emotion1 = player1.Face_Emotion(image1.path);
    double image_emotion2 = player2.Face_Emotion(image2.path);
    if (image_emotion1 > image_emotion2) {
      image_win = image1;
      image_lose = image2;
    } else {
      image_win = image2;
      image_lose = image1;
    }
    savePicture();
  }

  void shareImageAndText() async {
    //shareする際のテキスト
    try {
      final ImagePicker _picker = ImagePicker();
      File? _file;
      final XFile? _image =
          await _picker.pickImage(source: ImageSource.gallery);
      _file = File(_image!.path);

      await ShareExtend.share(_file.path, "image");
      // await ShareExtend.share(path, "image");
      // applicationDocumentsFile.delete();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    judgement();
    return Scaffold(
      backgroundColor: Color(0xffefedd7),
      appBar: AppBar(
        title: const Text('ホーム画面'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('勝者',
                  style: TextStyle(fontSize: 50, fontFamily: 'RocknRollOne')),
            ),
            Stack(
              children: [
                SizedBox(width: 360, child: Image.file(File(image_win.path))),
                // Image(
                //   image: AssetImage('images/explosion.gif'),
                //   fit: BoxFit.cover,
                //   color: Color.fromRGBO(0, 0, 0, 0.9),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    child: const Text('ホームに戻る', style: TextStyle(fontSize: 20)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      shareImageAndText();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    child: const Text('共有', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
