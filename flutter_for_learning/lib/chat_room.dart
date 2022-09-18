import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:image_picker/image_picker.dart';

String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  ChatRoomState createState() => ChatRoomState();
}

class ChatRoomState extends State<ChatRoom> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  final _other = const types.User(
    id: 'otheruser',
    firstName: "テスト",
    lastName: "太郎",
    imageUrl:
        "https://pbs.twimg.com/profile_images/1335856760972689408/Zeyo7jdq_bigger.jpg",
  );

  /// 他の人からのメッセージを確認
  // @override
  // void initState() {
  //   super.initState();
  //   _addMessage(types.TextMessage(
  //     author: _other,
  //     createdAt: DateTime.now().millisecondsSinceEpoch,
  //     id: randomString(),
  //     text: "テストです。",
  //   ));
  // }

  /// TextMessage.statusの確認
  @override
  void initState() {
    super.initState();
    for (types.User u in [_user, _other]) {
      _addMessage(types.TextMessage(
        author: u,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        text: "delivered",
        status: types.Status.delivered,
      ));
      _addMessage(types.TextMessage(
        author: u,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        text: "error",
        status: types.Status.error,
      ));
      _addMessage(types.TextMessage(
        author: u,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        text: "seen",
        status: types.Status.seen,
      ));
      _addMessage(types.TextMessage(
        author: u,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        text: "sending",
        status: types.Status.sending,
      ));
      _addMessage(types.TextMessage(
        author: u,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        text: "delivered",
        status: types.Status.delivered,
      ));
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Chat(
          theme: const DefaultChatTheme(
            primaryColor: Colors.green, // メッセージの背景色の変更
            userAvatarNameColors: [Colors.green], // ユーザー名の文字色の変更
          ),
          user: _user,
          messages: _messages,
          onSendPressed: _handleSendPressed,
          showUserAvatars: true,
          showUserNames: true,
          onAttachmentPressed: _handleImageSelection,
        ),
      );

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: randomString(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }
}
