import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_application_spajam2022/home.dart';
import 'result.dart';
import 'package:flutter_application_spajam2022/take_picture1.dart';

class Judge extends StatelessWidget {
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
        title: const Text('勝敗判定するよー'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 160, child: Image.file(File(image1.path))),
                Text(' VS ', style: TextStyle(fontSize: 20)),
                SizedBox(width: 160, child: Image.file(File(image2.path))),
              ],
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: const Text('結果を見る', style: TextStyle(fontSize: 30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
