import 'package:flutter/material.dart';
import 'result.dart';

class Judge extends StatelessWidget{
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
            image: AssetImage('images/判定.png'),
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
                  MaterialPageRoute(builder: (context) => Result(),
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