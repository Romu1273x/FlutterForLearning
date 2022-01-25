import 'package:flutter/material.dart';
import 'package:flutter_for_learning/views/todo_add.dart';

// リスト一覧画面用Widget
class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // Todoリストのデータ
  List<String> todoList = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      // ListViewを使いリスト一覧を表示
      // データを元にListViewを作成
      body: ListView.builder(
        // ListView.builderはitemBuilderプロパティで返すWidgetを複数生成する
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            // Keyは要素を一意に特定できるようにするための値を設定
            key: UniqueKey(),
            // onDismissedの中にスワイプされた時の動作を記述する。
            // directionにはスワイプの方向が入るため、方向によって処理を分けることができる。
            onDismissed: (direction) {
              setState(() {
                // スワイプされた要素をデータから削除
                todoList.removeAt(index);
              });
            },
            // ListViewの各要素の定義
            child: Card(
              child: ListTile(
                title: Text(todoList[index]),
              ),
            ),
          );
        },
      ),
      // +ボタンを表示
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          // リスト追加画面から渡される値を受け取る
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              // 遷移先の画面としてリスト追加画面を指定
              return TodoAddPage();
            }),
          );
          if (newListText != null) {
            setState(() {
              // リスト追加
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
        ),
    );
  }
}
