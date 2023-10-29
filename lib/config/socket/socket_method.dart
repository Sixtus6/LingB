import 'package:flutter/material.dart';
import 'package:lingb/config/socket/socket_client.dart';
import 'package:lingb/screens/chat_room/index.dart';
import 'package:lingb/screens/chat_room/provider.dart';
import 'package:lingb/screens/join_chat_room/create-room.dart';
import 'package:lingb/screens/join_chat_room/provider.dart';
import 'package:lingb/utils/constants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class SocketMethods {
  final _socket = SocketClient.instance.socket!;

  Map event = {
    "create": "create-room",
    "join": "join-room",
    "chat": "chat-room"
  };

  Map eventListeners = {
    "create": ["create-room-msg"],
    "join": ["join-room-msg", "join-room-error"],
    "chat": ["chat-room-msg", "chat-room-error"]
  };
  //create  room socket
  void createRoom(BuildContext context) {
    _socket.emit(event["create"], {});
    // Provider.of<JoinRoomProvider>(context, listen: false).updateBoolState(false);
  }

  //create room listiner
  void createRoomEvent(BuildContext context) {
    _socket.on(eventListeners["create"][0], (data) {
      Provider.of<JoinRoomProvider>(context, listen: false).updateRoomData(
        data,
      );
      // print(data);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => CreateRoom(
          id: data["roomid"].toString() ?? "",
        ),
      );
      roomIDController.text = data["roomid"].toString();
    });
  }

/* -------------------------- Chat-room listerner ------------------------- */
  void chatRoomEvent(BuildContext context) {
    _socket.on(eventListeners["chat"][0], (data) {


      // Provider.of<ChatMessagesProvider>(context, listen: false).updateMessage(
      //   data,
      // );
   
    });
  }

  void chatRoomErrorEvent(BuildContext context) {
    _socket.on(eventListeners["chat"][1], (data) {
      print(data);
    });
  }

/* -------------------------------- JOIN ROOM ------------------------------- */

  void joinRoom(String username, String roomid) {
    _socket.emit(event["join"], {"username": username, "roomid": roomid});
  }

  void joinRoomErrorListener(BuildContext context) {
    _socket.on(eventListeners["join"][1], (data) {
      // Provider.of<JoinRoomProvider>(context, listen: false).updateRoomData(
      //   data,
      // );
      // print(data);
      toast(data);
    });
  }

  void joinRoomEvent(BuildContext context) {
    _socket.on(eventListeners["join"][0], (data) {
      print(data);
      if (data[data.length - 1]["userName"] == userNameController.text) {
        ChatRoom(
                img:
                    "https://images.generated.photos/5up69kRDRX1KuGSbcG54wE0M4UWeT5gdNoXDJElP7Is/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/OTYxMDYxLmpwZw.jpg",
                name: userNameController.text)
            .launch(context);

        return;
      }

      // Provider.of<JoinRoomProvider>(context, listen: false).updateRoomData(
      //   data,
      // );

      print(data);
      toast(
          capitalizeFirstLetter(data[data.length - 1]["userName"]) + " Joined");
    });
  }
}

String capitalizeFirstLetter(String text) {
  if (text.isEmpty) {
    return text; // Return the original string if it's empty
  }
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}
