import 'package:flutter/material.dart';
import 'package:flutter_for_learning/main_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Providerを使うことを宣言
      home: ChangeNotifierProvider<MainViewModel>(
        create: (_) => MainViewModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('タイトル'),
          ),
          // Consumer配下を監視し、変更があった場合に更新する
          body: Consumer<MainViewModel>(builder: (context, model, child) {
            return Center(
              child: Column(
                children: [
                  Text(model.text),
                  FloatingActionButton(
                    child: Text('ボタン'),
                    onPressed: (){
                      // ViewModelで値を更新
                      model.changeText();
                    }
                  ),
                ]
              )
            );
          }),
        )
      )
    );          
  }
}
