// import 'dart:io';
// import 'dart:ui';

// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_spajam2022/result.dart';
// import 'package:http/http.dart';
// import 'dart:convert';

// import 'dart:io';
// import 'dart:math' as math;
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_spajam2022/home.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'result.dart';
// import 'package:flutter_application_spajam2022/take_picture1.dart';
// import 'face_emo.dart';

// import 'package:path/path.dart';

// // リストを入れるModelクラス
// class Emotion {
//   String emo;
//   double num;

//   Emotion(this.emo, this.num);
// }

// class FaceEmo extends StatefulWidget {
//   const FaceEmo({super.key});
//   @override
//   State<FaceEmo> createState() => _FaceEmoState();
// }

// class _FaceEmoState extends State<FaceEmo> {
//   void judgement() {
//     var random = math.Random();
//     double saikoro = random.nextDouble();
//     if (saikoro >= 0.5) {
//       image_win = image1;
//       image_lose = image2;
//     } else {
//       image_win = image2;
//       image_lose = image1;
//     }
//   }

//   var emotion = {};
//   var URL =
//       'https://japaneast.api.cognitive.microsoft.com/face/v1.0/detect?returnFaceId=false&returnFaceLandmarks=false&returnFaceAttributes=emotion&recognitionModel=recognition_01&returnRecognitionModel=false&detectionModel=detection_01&faceIdTimeToLive=86400';

//   Future<void> getData() async {
//     final uri = Uri.parse(URL);
//     Map<String, String> headers = {
//       'Ocp-Apim-Subscription-Key': '2f8e6c4ad71b4659b31043eb2cdb65df',
//       'Content-Type': 'application/octet-stream'
//     };
//     // アセットからデータをロードする
//     final byteData1 = await rootBundle.load('images/kao.jpeg');
//     final byteData2 = await rootBundle.load('images/kao.jpeg');
//     Uint8List imageBytes = byteData.buffer
//         .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
// // base64 code
//     var Post = await post(
//       uri,
//       headers: headers,
//       body: imageBytes,
//     );

//     final jsonResponse = jsonDecode(Post.body);
//     print(jsonResponse);
//     final emotion2 = jsonResponse[0]['faceAttributes']['emotion'];

//     print(jsonResponse[0]);

//     emotion = emotion2;
//     print(emotion);
//     print(Post.statusCode);
//     setState(() {});
//   }

//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter = (_counter + 1) % emotion.length;
//     });
//   }

//   @override
  // void initState() {
  //   super.initState();

  //   getData();
  // }

//   @override
//   Widget build(BuildContext context) {
//     double sum = 0;
//     // Map => List
//     final listJmp =
//         emotion.entries.map((e) => Emotion(e.key, e.value)).toList();

//     // Listから要素を取り出す
//     for (int i = 0; i < listJmp.length; i++) {
//       print(listJmp[i].emo);
//       print(listJmp[i].num);
//       sum = listJmp[1].num + listJmp[4].num * 0.5 + listJmp[7].num;
//       print(sum);
//       // sum = sum + listJmp[i].num;
//     }
//     judgement();
//     return Scaffold(
//       backgroundColor: Color(0xffefedd7),
//       appBar: AppBar(
//         title: const Text('ホーム画面'),
//       ),
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               Container(
//                 width: 300,
//                 height: 300,
//                 decoration: const BoxDecoration(
//                     image: DecorationImage(
//                   image: AssetImage('images/判定.png'),
//                   // fit: BoxFit.cover,
//                 )),
//               ),
//               SizedBox(
//                 width: 300,
//                 height: 300,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Result(),
//                         fullscreenDialog: true,
//                       ),
//                     );
//                   },
//                   child: const Text(''),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.transparent,
//                     elevation: 0,
//                     onPrimary: Colors.blue,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             height: 300,
//             child: Image(
//               image: AssetImage('images/Videotogif.gif'),
//               fit: BoxFit.cover,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// Widget _textWidget(List list, int index, int counter, String key) {
//   if (key == 'emo') {
//     return Text(
//       list[index].emo,
//       style:
//           index == counter ? TextStyle(color: Colors.blue, fontSize: 28) : null,
//     );
//   }
//   if (key == 'num') {
//     return Text(
//       list[index].num.toString(),
//       style:
//           index == counter ? TextStyle(color: Colors.red, fontSize: 28) : null,
//     );
//   } else {
//     return Text('nothing');
//   }
// }
