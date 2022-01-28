import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  String text = 'テキスト';

  void changeText() {
    text = 'テキストを変更';
    notifyListeners();
  }
}