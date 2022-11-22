import 'dart:io';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:path/path.dart';

// リストを入れるModelクラス
class Emotion {
  String emo;
  double num;

  Emotion(this.emo, this.num);
}

class FaceDetector {
  String image_url = '';

  double sum = 0;
  FaceDetector(String image) {
    this.image_url = image;
    getData();
  }
  var URL =
      'https://japaneast.api.cognitive.microsoft.com/face/v1.0/detect?returnFaceId=false&returnFaceLandmarks=false&returnFaceAttributes=emotion&recognitionModel=recognition_01&returnRecognitionModel=false&detectionModel=detection_01&faceIdTimeToLive=86400';

  Future<double> getData() async {
    final uri = Uri.parse(URL);
    Map<String, String> headers = {
      'Ocp-Apim-Subscription-Key': '2f8e6c4ad71b4659b31043eb2cdb65df',
      'Content-Type': 'application/octet-stream'
    };
    // アセットからデータをロードする
    final byteData = await rootBundle.load(image_url);
    Uint8List imageBytes = byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
// base64 code
    var Post = await post(
      uri,
      headers: headers,
      body: imageBytes,
    );

    var jsonResponse = jsonDecode(Post.body);

    var emotion = jsonResponse[0]['faceAttributes']['emotion'];

    // Map => List
    final listJmp =
        emotion.entries.map((e) => Emotion(e.key, e.value)).toList();

    // Listから要素を取り出す
    for (int i = 0; i < listJmp.length; i++) {
      sum = listJmp[1].num + listJmp[4].num * 0.5 + listJmp[7].num;
      // print('hell');
      // print(sum);
      // sum = sum + listJmp[i].num;
    }
    return sum;
  }

  // double getSum() {
  //   getData();
  //   print('くそ');
  //   print(sum);
  //   return sum;
  // }
}
