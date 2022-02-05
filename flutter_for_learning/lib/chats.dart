import 'package:flutter/material.dart';

class ChatData with ChangeNotifier {
  final _chats = <String>[];

  List<String> get chats => _chats;
  int get chatCount => _chats.length;

  String getChat(int index) {
    return _chats[index];
  }

  void addChat(String chat) {
    _chats.add(chat);
    notifyListeners();
  }
}
