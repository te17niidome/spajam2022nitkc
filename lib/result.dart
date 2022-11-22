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
// import 'package:flutter_application_spajam2022/judge.dart';

class Result extends StatefulWidget {
  // const Result({
  //   Key? key

  // })
  ResultState createState() => ResultState();
}

class ResultState extends State<Result> with SingleTickerProviderStateMixin {
  late Future<void> _initializeControllerFuture;
  late AnimationController _animeController;
  late Animation<double> animation;

  // 判定部分
  void judgement() {
    var random = math.Random();
    double saikoro = random.nextDouble();
    if (saikoro >= 0.5) {
      image_win = image1;
    } else {
      image_win = image2;
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

  Future<void> AnimeOn() async {
    // var random = math.Random();
    int _time = 1600; // 5秒間待つ(爆発している時間)
    await Future.delayed(Duration(milliseconds: _time));
    _animeController.forward();
  }

  @override
  void initState() {
    super.initState();

    // アニメーション
    AnimeOn();
    _animeController = AnimationController(
      vsync: this, // with SingleTickerProviderStateMixin を忘れずに
      duration: Duration(milliseconds: 1), // ここに遷移する時間記入
    );
  }

  @override
  void dispose() {
    // ウィジェットが破棄されたら、コントローラーを破棄
    _animeController.dispose();
    super.dispose();
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
                PositionedTransition(
                  rect: RelativeRectTween(
                    begin: RelativeRect.fromLTRB(0, 0, 0, 0),
                    end: RelativeRect.fromLTRB(1000, 1000, 1000, 1000),
                  ).animate(CurvedAnimation(
                    parent: _animeController,
                    curve: Curves.easeIn,
                  )),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Image(
                      image: AssetImage('images/explosion.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
