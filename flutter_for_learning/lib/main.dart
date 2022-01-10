import 'package:flutter/material.dart';
import 'package:flutter_for_learning/page1.dart';
import 'package:flutter_for_learning/page2.dart';

void main() {
  runApp(const MyApp());
}

// StatelessWidget：状態を持たないWidget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'タイトル';

    // MaterialApp：Flutterアプリケーションの全体を管理
    // 主に全体のデザインや画面遷移をする場合の状態監視、アプリケーション全体のタイトルや全体にかかわるプロパティの管理
    return MaterialApp(
      title: appTitle,
      // ThemeData：テーマを作成
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ルーティングの設定
      initialRoute: '/', // 一番最初に遷移するルーティングを指定
      routes: {
        '/': (context) => MyHomePage(title: appTitle),
        '/page1': (context) => Page1(title: 'Page1'),
        '/page2': (context) => Page2(title: 'Page2'),
      },
    );
  }
}

// StatefulWidget：状態を持つWidget
class MyHomePage extends StatefulWidget {
  //  titleは引数として受け取っている
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  // StatefulWidgetのcreateStateを呼び出し、Stateを作成
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  // 描画したいWidgetを記述
  Widget build(BuildContext context) {
    // Scaffold：モバイルアプリ画面を作る上でよく使われるメニュー表示方法を含めて画面全体を管理する部品
    return Scaffold(
      appBar: AppBar(
        // titleは親オブジェクトを継承して受け取っている
        title: Text(widget.title),
      ),

      body:  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // childrenをメイン軸の中心に配置する
          children: [
            TextButton(
              onPressed: () {
                // ルーティングを用いて遷移先を指定
                Navigator.pushNamed(context, '/page1');
              },
              child: Text('Go to page1'),
            ),

            TextButton(
              onPressed: () {
                // ルーティングを用いて遷移先を指定
                Navigator.pushNamed(context, '/page2');
              },
              child: Text('Go to page2'),
            ),
          ],
      ),),

    );
  }
}
