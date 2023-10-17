import 'package:flutter/material.dart';

class JoinRoomProvider with ChangeNotifier {
  late String _selectedItem;

  String get selectedItem => _selectedItem;

  void setSelectedItem(String item) {
    _selectedItem = item;
    notifyListeners();
  }
}
