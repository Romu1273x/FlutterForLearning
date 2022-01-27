import 'package:flutter/material.dart';

class TodoAddViewModel extends ChangeNotifier {
  // 入力されたテキストをデータとして持つ
  String _text = '';

  void setText(text) {
    _text = text;
  }

  void getText() {
    this._text;
    notifyListeners();
 }
	
}