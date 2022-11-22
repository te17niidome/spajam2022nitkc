import 'package:flutter/material.dart';
import 'package:flutter_application_spajam2022/take_picture1.dart';
// import 'package:flutter_application_spajam2022/take_picture2.dart';
// import 'take_picture1.dart';

class PictureReady1 extends StatelessWidget {
  // SecondPage(this.name); // *** コンストラクタ 変数を指定しておくことによって値を受け取ることが出来る．
  // final String name; // 値が入る変数
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffefedd7),
        // 上部のタイトルバー
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('プレイヤー1の写真撮る画面だよ'),
        ),
        body: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/Player1.png'),
                // fit: BoxFit.cover,
              )),
            ),
            Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TakePicture1(),
                      // fullscreenDialog: true,
                    ),
                  );
                },
                child: Container(
                  width: 510,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/takePicture.png'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
