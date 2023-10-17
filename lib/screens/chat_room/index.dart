import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lingb/config/color.dart';
import 'package:lingb/config/size.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class Chat_Message extends StatefulWidget {
  const Chat_Message(
      {super.key,
      required this.img,
      required this.name,
      this.messages,
      this.time,
      this.isOnline = true});
  final String img;
  final String name;
  final String? messages;
  final String? time;
  final bool? isOnline;

  @override
  State<Chat_Message> createState() => _Chat_MessageState();
}

class _Chat_MessageState extends State<Chat_Message> {
  final List<types.Message> _messages = [];
  final _user = types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    print(values);
    return base64UrlEncode(values);
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );
    _addMessage(textMessage);
    print(_messages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      appBar: AppBar(
        backgroundColor: context.cardColor,
        title: Column(
          children: [
            Text(widget.name,
                    style: secondaryTextStyle(weight: FontWeight.bold))
                .paddingBottom(SizeConfigs.getPercentageWidth(1)),
            // SizeConfigs.getPercentageWidth(1).toInt().height,
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Online", style: secondaryTextStyle(size: 11)),
                  SizeConfigs.getPercentageWidth(1).toInt().width,
                  CircleAvatar(
                    radius: SizeConfigs.getPercentageWidth(1),
                    backgroundColor:
                        widget.isOnline! ? ColorConfig.green : ColorConfig.red,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
              radius: SizeConfigs.getPercentageWidth(7),
              backgroundColor: context.cardColor,
              backgroundImage: NetworkImage(widget.img)),
          // .paddingLeft(SizeConfigs.getPercentageWidth(5)),
          SizeConfigs.getPercentageWidth(3).toInt().width,
        ],
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.iconColor),
          onPressed: () {
            finish(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Chat(
              theme: DefaultChatTheme(
                  primaryColor: context.cardColor,
                  secondaryColor: ColorConfig.green,
                  inputBackgroundColor: context.cardColor,
                  backgroundColor: context.scaffoldBackgroundColor),
              showUserNames: true,
              messages: _messages,
              textMessageOptions: TextMessageOptions(isTextSelectable: true),
              onSendPressed: _handleSendPressed,
              user: _user,
            ),
          ).withSize(width: double.infinity).expand(),
        ],
      ),
    );
  }
}