import 'package:flutter/material.dart';
// import 'package:flutter_application_spajam2022/picture_ready_2.dart';
import 'picture_ready_1.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: const Text('ホーム画面'),
      ),
      body:Center(
        child:ElevatedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PictureReady1(),
              fullscreenDialog: true,
              ),
            );
          },
          child: const Text('写真を撮る'),
        ),
      ),
    );
  }
}