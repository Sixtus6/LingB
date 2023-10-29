import 'package:flutter/material.dart';
import 'package:lingb/config/socket/socket_client.dart';
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
      print(data);

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

  void joinRoom(String username, String roomid) {
    _socket.emit(event["join"], {"username": username, "roomid": roomid});
  }

  void JoinRoomErrorListener(BuildContext context) {
    _socket.on(eventListeners["join"][1], (data) {
      // Provider.of<JoinRoomProvider>(context, listen: false).updateRoomData(
      //   data,
      // );
      print(data);
      toast(data);
    });
  }
}
