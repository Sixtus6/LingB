import 'package:flutter/material.dart';
import 'package:lingb/config/socket/socket_client.dart';

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
  void createRoom() {
    _socket.emit(event["create"], {});
  }

  //create room listiner
  void createRoomEvent(BuildContext context) {
    _socket.on(eventListeners["create"], (data) {
      print(data);
    });
  }
}
