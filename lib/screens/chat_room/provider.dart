import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'dart:convert';
import 'dart:math';

import 'package:lingb/config/color.dart';

class ChatMessagesProvider with ChangeNotifier {
  final List<types.Message> _messages = [
    types.TextMessage(
      author: types.User(
          id: "82091008-a484-4a89-ae75-a22bf8d6f3ac", firstName: "sixtus"),
      createdAt: DateTime.now().microsecondsSinceEpoch,
      id: '1',
      text: 'Hello, this is a sender message.',
    ),
    // Example recipient message
    types.TextMessage(
      author: types.User(
          id: '82091008-a484-4a89-aeu75ere-a2er-bfre8de6fac',
          firstName: "francis"),
      createdAt: DateTime.now().microsecondsSinceEpoch,
      id: '2',
      text: 'Hi, this is a recipient message.',
    ),
  ];
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

  Widget customTextMessageBuilder(types.TextMessage message,
      {required int messageWidth, required bool showName}) {
    final isRecipientMessage = message.author.id != 'sender_user_id';

    // Customize the appearance of the text message
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: isRecipientMessage ? Colors.grey.shade100 : Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showName && !isRecipientMessage)
            Text(
              "sender",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          Text(
            message.text,
            style: TextStyle(
              color: isRecipientMessage ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget customTextMessageBuilders(types.TextMessage message,
      {required int messageWidth, required bool showName}) {
    final isRecipientMessage = message.author.id != 'sender_user_id';
    final senderName = isRecipientMessage
        ? message.author.firstName ?? "sender"
        : 'Sender'; // Use a default name for sender messages

    // Customize the appearance of the text message
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        //  color: isRecipientMessage ? Colors.transparent : Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showName) // Check if showName is true
              Text(
                isRecipientMessage ? message.author.firstName! : senderName,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: ColorConfig.white),
              ),
            Text(
              message.text,
              // style: TextStyle(
              //   color: isRecipientMessage ? Colors.black : Colors.blue,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
