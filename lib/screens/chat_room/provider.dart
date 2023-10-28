import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'dart:convert';
import 'dart:math';

class ChatMessagesProvider with ChangeNotifier {
  final List<types.Message> _messages = [];
  final user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  List<types.Message> get messages => _messages;

  void addMessage(types.Message message) {
    _messages.insert(0, message);
    notifyListeners();
  }

 String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    print(values);
    return base64UrlEncode(values);
  }


  void handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );
    addMessage(textMessage);
    print(_messages);
  }

}