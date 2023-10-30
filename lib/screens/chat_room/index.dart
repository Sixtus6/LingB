import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:lingb/config/color.dart';
import 'package:lingb/config/size.dart';
import 'package:lingb/config/socket/socket_method.dart';
import 'package:lingb/screens/chat_room/provider.dart';
import 'package:lingb/screens/join_chat_room/join_room.dart';
import 'package:lingb/screens/join_chat_room/provider.dart';
import 'package:lingb/utils/constants.dart';
import 'package:lingb/widget/dropdown.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom(
      {super.key,
      required this.img,
      required this.name,
      this.messages,
      this.time,
      this.isOnline = true,
      this.userid,
      this.firstname});
  final String img;
  final String name;
  final String? messages;
  final String? userid;
  final String? firstname;
  final String? time;
  final bool? isOnline;

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  // final List<types.Message> _messages = [];
  // final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  // void _addMessage(types.Message message) {
  //   setState(() {
  //     _messages.insert(0, message);
  //   });
  // }

  // String randomString() {
  //   final random = Random.secure();
  //   final values = List<int>.generate(16, (i) => random.nextInt(255));
  //   print(values);
  //   return base64UrlEncode(values);
  // }

  // void _handleSendPressed(types.PartialText message) {
  //   final textMessage = types.TextMessage(
  //     author: _user,
  //     createdAt: DateTime.now().millisecondsSinceEpoch,
  //     id: randomString(),
  //     text: message.text,
  //   );
  //   _addMessage(textMessage);
  //   print(_messages);
  // }
  @override
  // void initState() {
  //   _socketMethods.chatRoomEvent(context);
  //   print("init");
  //   // TODO: implement initState
  //   super.initState();
  // }
  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
      return text; // Return the original string if it's empty
    }
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: SizeConfigs.getPercentageWidth(16),
        backgroundColor: ColorConfig.black,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizeConfigs.getPercentageWidth(1).toInt().height,
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(capitalizeFirstLetter(widget.firstname! + " "),
                        style: secondaryTextStyle(
                            weight: FontWeight.bold, color: ColorConfig.white)),
                    SizeConfigs.getPercentageWidth(1).toInt().width,
                    CircleAvatar(
                      radius: SizeConfigs.getPercentageWidth(1),
                      backgroundColor: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
            // SizeConfigs.getPercentageWidth(1).toInt().height,
            Consumer<JoinRoomProvider>(
              builder: (BuildContext context, dropdownModel, _) {
                return Container(
                  height: SizeConfigs.getPercentageWidth(5),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon: Shimmer.fromColors(
                          baseColor: ColorConfig.primary,
                          highlightColor: ColorConfig.white,
                          child: Icon(
                            Icons.arrow_drop_down,
                          )),
                      value: dropdownModel.selectedItem,
                      iconEnabledColor: ColorConfig.primary,
                      borderRadius: BorderRadius.circular(15),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          dropdownModel.setSelectedItem(newValue);
                        }
                      },
                      items: _items.map<DropdownMenuItem<String>>(
                        (String value) {
                          /// print(value.runtimeType);
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        actions: [
          // Text("Active Users",
          //         style: secondaryTextStyle(
          //             weight: FontWeight.bold, color: ColorConfig.white))
          //     .paddingBottom(SizeConfigs.getPercentageWidth(1))
          //     .paddingTop(SizeConfigs.getPercentageWidth(4)),
          // // SizeConfigs.getPercentageWidth(1).toInt().height,
          Center(
            child: Column(
              children: [
                SizeConfigs.getPercentageWidth(5).toInt().height,
                Consumer<JoinRoomProvider>(
                    builder: (context, joinRoomProvider, _) {
                  return Row(
                    children: [
                      Text(
                        'lang:',
                        style: secondaryTextStyle(size: 13),
                      ),
                      Text(
                        ' ${joinRoomProvider.selectedItem}',
                        style:
                            secondaryTextStyle(size: 11, color: Colors.white),
                      ),
                    ],
                  );
                }),
                SizeConfigs.getPercentageWidth(1).toInt().height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Users:", style: secondaryTextStyle(size: 11)),
                    SizeConfigs.getPercentageWidth(1).toInt().width,
                    Consumer<JoinRoomProvider>(
                      builder: (BuildContext context, provider, _) {
                        return Text(provider.count.toString(),
                            style: secondaryTextStyle(
                                size: 11, color: Colors.green));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          // .paddingLeft(SizeConfigs.getPercentageWidth(5)),
          SizeConfigs.getPercentageWidth(3).toInt().width,
        ],
        elevation: 10,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorConfig.primary),
          onPressed: () {
            // finish(context);
            JoinRoomScreen().launch(context);
          },
          //import 'package:socket_io_client/socket_io_client.dart' as io;
        ),
      ),
      body: Consumer<ChatMessagesProvider>(
        builder: (BuildContext context, provider, _) {
          return Container(
            color: Colors.black,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.6,
                  child: Image.asset(
                    "assets/icon/lingb.png", // Replace with your image asset
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Column(
                  children: [
                    Chat(
                      theme: DefaultChatTheme(
                        backgroundColor: Colors.transparent,
                        primaryColor: ColorConfig.primary,
                        secondaryColor: Color(0xff4d4d4d).withOpacity(0.7),
                        // secondaryColor: Colors.white30,
                        inputBackgroundColor: Colors.grey.shade900,
                      ),
                      showUserNames: true,
                      messages: provider.messages,
                      //  customMessageBuilder: provider.customTextMessageBuilder,
                      textMessageOptions:
                          TextMessageOptions(isTextSelectable: true),
                      onSendPressed: provider.handleSendPressed,

                      // onSendPressed: provider.handleSendPressed,
                      user:
                          User(id: widget.userid!, firstName: widget.firstname),
                      textMessageBuilder: provider.customTextMessageBuilders,
                    ).withSize(width: double.infinity).expand(),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<String> _items = ["English", 'Hausa', 'Igbo', 'Yoruba'];
