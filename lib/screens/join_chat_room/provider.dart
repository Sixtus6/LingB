import 'package:flutter/material.dart';
import 'package:lingb/screens/join_chat_room/create-room.dart';

class JoinRoomProvider with ChangeNotifier {
  Map<String, dynamic> _roomData = {};
  Map<String, dynamic> get roomData => {};
  bool hasUpdated = false;

  void updateRoomData(
    Map<String, dynamic> data,
  ) {
    _roomData = data;
    print("_roomData");
    print(_roomData);
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => CreateRoom(
    //     id: roomData["roomid"].toString() ?? "",
    //   ),
    // );
    notifyListeners();
  }

  void updateBoolState(bool state) {
    hasUpdated = state;
    print([hasUpdated]);
    notifyListeners();
  }

//   void myRefactoredFunction(BuildContext context) async {
//   if (hasUpdated) {
//     print(roomData["roomid"].toString());
//     await
//   } else {
//     print("it's false" + hasUpdated.toString());
//   }
// }

  String _selectedItem =
      'Select your preferred language'; // Initialize to an initial value

  String get selectedItem => _selectedItem;

  void setSelectedItem(String item) {
    _selectedItem = item;
    notifyListeners();
  }
}
