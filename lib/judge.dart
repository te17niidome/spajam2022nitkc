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

class Judge extends StatefulWidget {
  const Judge({super.key});

  @override
  State<Judge> createState() => _JudgeState();
}

class _JudgeState extends State<Judge> {
  var image_win;
  var image_lose;
  void judgement() async {
    var random = math.Random();
    double saikoro = random.nextDouble();
    FaceDetector player1 = await FaceDetector(image1.path);
    FaceDetector player2 = await FaceDetector(image2.path);
    await Future.delayed(Duration(seconds: 1));
    double image_emotion1 = await player1.sum;
    double image_emotion2 = await player2.sum;
    print('helo');
    print(image_emotion1);
    print('しね');
    print(image_emotion2);
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
                        builder: (context) => Result(image_win, image_lose),
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
