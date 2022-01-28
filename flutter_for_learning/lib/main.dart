import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String text = 'テキスト';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('タイトル'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(text),
              FloatingActionButton(
                child: Text('ボタン'),
                onPressed: (){
                  // 処理を追加
                }
              ),
            ]
          )
        ),
      ),
    );
  }
}
