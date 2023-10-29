import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:math';

import 'package:lingb/config/color.dart';
import 'package:lingb/config/size.dart';
import 'package:nb_utils/nb_utils.dart';

class ChatMessagesProvider with ChangeNotifier {
  final List<types.Message> _messages = [
    types.TextMessage(
      author: const types.User(
          id: "82091008-a484-4a89-ae75-a22bf8d6f3ac", firstName: "sixtus"),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: '1',
      text: 'Hello, this is a sender message.',
    ),
    // Example recipient message
    types.TextMessage(
      author: const types.User(
          id: '82091008-a484-4a89-aeu75ere-a2er-bfre8de6fac',
          firstName: "francis"),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: '2',
      text: 'Hi, this is a recipient message.',
    ),
    types.TextMessage(
      author: const types.User(
          id: '82091008-a484-4a89-aedu75ere-a2er-bfre8de6fac',
          firstName: "jacob"),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: '3',
      text: 'Hi, waggan.',
    ),
  ];

  void updateMessage(types.TextMessage message) {
    _messages.insert(0, message);
    notifyListeners();
  }

  final user = const types.User(
      id: "82091008-a484-4a89-ae75-a22bf8d6f3ac", firstName: "sixtus");
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

  Widget customTextMessageBuilders(types.TextMessage message,
      {required int messageWidth, required bool showName}) {
    final isRecipientMessage = message.author.id != 'sender_user_id';
    final senderName = isRecipientMessage
        ? message.author.firstName ?? "sender"
        : 'Sender'; // Use a default name for sender messages
    final messageTime = DateTime.fromMillisecondsSinceEpoch(message.createdAt!);
    final time = DateFormat.Hm().format(messageTime);

    // Customize the appearance of the text message
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfigs.getPercentageWidth(2)),
      decoration: BoxDecoration(
        //  color: isRecipientMessage ? Colors.transparent : Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: SizeConfigs.getPercentageWidth(4),
            right: SizeConfigs.getPercentageWidth(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showName) // Check if showName is true

              Text(
                isRecipientMessage
                    ? capitalizeFirstLetter(message.author.firstName!)
                    : senderName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorConfig.carbackground),
              ),
            Text(
              message.text,
              // style: TextStyle(
              //   color: isRecipientMessage ? Colors.black : Colors.blue,
              // ),
            ),
            // Row(
            //   children: [
            //     Container().expand(),
            //     Text(
            //       time,
            //       style: TextStyle(
            //         fontSize: 10,
            //         color: isRecipientMessage
            //             ? ColorConfig.carbackground
            //             : Colors.blue,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

String capitalizeFirstLetter(String text) {
  if (text.isEmpty) {
    return text; // Return the original string if it's empty
  }
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}
