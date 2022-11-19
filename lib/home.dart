import 'package:flutter/material.dart';
// import 'package:flutter_application_spajam2022/picture_ready_2.dart';
import 'picture_ready_1.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xffefedd7),
      appBar:AppBar(
        title: const Text('ホーム画面'),
      ),
      body:Container(
        width: 1000,
        height: 2500,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/1.png'),
            // fit: BoxFit.cover,
          )
        ),
        child:  Center(
          child: SizedBox(
            width: 220,
            height: 250,
            child:ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PictureReady1(),
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
            ) ,
          ),
        ),
      ),
    );
  }
}