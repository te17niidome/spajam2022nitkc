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

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
