import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// StatelessWidget：状態を持たないWidget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MaterialApp：Flutterアプリケーションの全体を管理
    // 主に全体のデザインや画面遷移をする場合の状態監視、アプリケーション全体のタイトルや全体にかかわるプロパティの管理
    return MaterialApp();
  }
}

// StatefulWidget：状態を持つWidget
class MyHomePage extends StatefulWidget {
  @override
  // StatefulWidgetのcreateStateを呼び出し、Stateを作成
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  // 描画したいWidgetを記述
  Widget build(BuildContext context) {
    // Scaffold：モバイルアプリ画面を作る上でよく使われるメニュー表示方法を含めて画面全体を管理する部品
    return Scaffold();
  }
}
