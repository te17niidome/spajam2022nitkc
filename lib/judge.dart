import 'package:flutter/material.dart';
import 'result.dart';

class Judge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('勝敗判定するよー'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('判定'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: const Text('結果を見る'),
            ),
          ],
        ),
      ),
    );
  }
}
