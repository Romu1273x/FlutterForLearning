import 'package:flutter/material.dart';
import 'package:flutter_for_learning/chats.dart';
import 'package:flutter_for_learning/screen.dart';
import 'package:provider/provider.dart';

void main() {
  // MyApp()配下でChatDataを監視
  runApp(ChangeNotifierProvider<ChatData>(
    create: (context) => ChatData(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
    );
  }
}
