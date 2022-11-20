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
      backgroundColor: Color(0xffefedd7),
      appBar: AppBar(
        title: const Text('ホーム画面'),
      ),
      body: Column(
        children: [
          Container(
            width: 1000,
            height: 2500,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/判定.png'),
              // fit: BoxFit.cover,
            )),
          ),
          SizedBox(
            width: 220,
            height: 250,
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
          Container(
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
