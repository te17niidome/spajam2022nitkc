import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_application_spajam2022/home.dart';
import 'package:flutter_application_spajam2022/take_picture1.dart';
// import 'package:flutter_application_spajam2022/judge.dart';

class Result extends StatelessWidget {
  var image_win;
  // 判定部分
  void judgement() {
    var random = math.Random();
    double saikoro = random.nextDouble();
    if (saikoro >= 0.5) {
      image_win = image1;
    } else {
      image_win = image2;
    }
  }

  @override
  Widget build(BuildContext context) {
    judgement();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Judgement Result'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('判定', style: TextStyle(fontSize: 50)),
            ),
            SizedBox(width: 360, child: Image.file(File(image_win.path))),
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
              child: const Text('ホームに戻る'),
            ),
          ],
        ),
      ),
    );
  }
}
