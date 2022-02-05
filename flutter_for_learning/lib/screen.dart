import 'package:flutter/material.dart';
import 'package:flutter_for_learning/chats.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            // チャットリスト表示箇所
            child: ChatList(),
          ),
          Divider(height: 2, color: Colors.black),
          // チャット入力箇所
          ChatInput(),
        ],
      ),
    ));
  }
}

// チャットリスト表示
class ChatList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => Divider(color: Colors.black),
      // チャットリストの総数
      itemCount: Provider.of<ChatData>(context).chatCount,
      itemBuilder: (BuildContext context, int index) {
        // リストとして表示する中身
        return ChatListTile(index: index);
      },
    );
  }
}

// チャット内容表示
class ChatListTile extends StatelessWidget {
  const ChatListTile({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    // チャットリスト<ChatData>に変更があった時に呼ばれる
    return Consumer<ChatData>(
      builder: (context, chatData, child) {
        final currentChat = chatData.getChat(index);
        return ListTile(
          title: Text(currentChat),
        );
      },
    );
  }
}

// チャット入力
class ChatInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        // チャットリストを追加
        onSubmitted: Provider.of<ChatData>(context, listen: false).addChat,
      ),
    );
  }
}