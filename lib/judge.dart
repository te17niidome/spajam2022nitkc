import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_application_spajam2022/home.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'result.dart';
import 'package:flutter_application_spajam2022/take_picture1.dart';
import 'face_emo.dart';
import 'face_detec.dart';

class Judge extends StatelessWidget {
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
  }

  @override
  Widget build(BuildContext context) {
    judgement();
    return Scaffold(
      backgroundColor: Color(0xffefedd7),
      appBar: AppBar(
        title: const Text('ホーム画面'),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('images/判定.png'),
                  // fit: BoxFit.cover,
                )),
              ),
              SizedBox(
                width: 300,
                height: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  child: const Text(''),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    onPrimary: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 300,
            child: Image(
              image: AssetImage('images/Videotogif.gif'),
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
