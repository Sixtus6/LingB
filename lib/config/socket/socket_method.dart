import 'package:lingb/config/socket/socket_client.dart';

class SocketMethods {
  final _socket = SocketClient.instance.socket!;

  Map event = {
    "create": "create-room",
    "join": "join-room",
    "chat": "chat-room"
  };
  //create  room socket
  void createRoom() {
    _socket.emit(event["create"], {});
  }
  
}
