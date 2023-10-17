import 'package:flutter/material.dart';

class JoinRoomProvider with ChangeNotifier {
 String _selectedItem = 'Select your preferred language'; // Initialize to an initial value

  String get selectedItem => _selectedItem;

  void setSelectedItem(String item) {
    _selectedItem = item;
    notifyListeners();
  }
}
