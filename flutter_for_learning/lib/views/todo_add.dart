import 'package:flutter/material.dart';
import 'package:flutter_for_learning/view_models/todo_add_view_model.dart';
import 'package:provider/provider.dart';

// リスト追加画面用Widget
class TodoAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoAddViewModel>(
      create: (_) => TodoAddViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('リスト追加'),
        ),
        body: TodoAddPageView()
      )
    );
  }
}

class TodoAddPageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TodoAddViewModel>(context);
    return content(context, model);
  }

  Widget content(BuildContext context, TodoAddViewModel model) {
    return Container(
      // 余白を付ける
      padding: EdgeInsets.all(64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // 中央に配置
        // childrren内にUIを配置
        children: <Widget>[
          // <テキスト入力>を表示
          TextField(
            // onChangedで_textに値をセット
            onChanged: (value) {
              model.setText(value);
            },
            style: TextStyle(color: Colors.blue)
            ),

          // <リスト追加ボタン>を表示
          const SizedBox(height: 8),
          Container(
            // 横幅いっぱいに広げる
            width: double.infinity,
            // リスト追加ボタン
            child: ElevatedButton(
              onPressed: () {
                // "pop"の引数から前の画面にデータを渡す
                Navigator.of(context).pop(model.getText());
              },
              child: Text('リスト追加', style: TextStyle(color: Colors.white)),
            ),
          ),

          // <キャンセルボタン>を表示
          const SizedBox(height: 8),
          Container(
            // 横幅いっぱいに広げる
            width: double.infinity,
            // キャンセルボタン
            child: TextButton(
              // ボタンをクリックした時の処理
              onPressed: () {
                // "pop"で前の画面に戻る
                Navigator.of(context).pop();
              },
              child: Text('キャンセル'),
            ),
          ),
        ],
      ),
    );
  }
}