import 'package:flutter/material.dart';
import 'package:flutter_application_spajam2022/take_picture1.dart';
// // image_picker
// import 'package:image_picker/image_picker.dart';

// // image_gallery_saver
// import 'package:image_gallery_saver/image_gallery_saver.dart';

// // esys_flutter_share
// import 'package:esys_flutter_share/esys_flutter_share.dart';

// import 'dart:io'; //File
// import 'dart:typed_data';

import 'home.dart'; // Uint8List

void main() {
  amain();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'esys_flutter_share'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage( {super.key, required this.title});

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late File _image;
//   final picker = ImagePicker();

//   // 画像の読み込み
//   Future _getImage() async {
//     //final pickedFile = await picker.getImage(source: ImageSource.camera);//カメラ
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);//アルバム

//     if(pickedFile != null) {
//       setState((){
//         _image = File(pickedFile.path);
//       });
//     }
//   }

// 画像の保存
// Future _saveImage() async {
//   if(_image != null) {
//     Uint8List _buffer = await _image.readAsBytes();
//     final result = await ImageGallerySaver.saveImage(_buffer);
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
