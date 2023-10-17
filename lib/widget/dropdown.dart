import 'package:flutter/material.dart';
import 'package:lingb/screens/join_chat_room/provider.dart';
import 'package:provider/provider.dart';

class DropdownMenuWithDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<JoinRoomProvider>(
      builder: (context, dropdownModel, _) {
        return Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropdownButton<String>(
            value: dropdownModel.selectedItem,
            onChanged: (String? newValue) {
              if (newValue != null) {
                dropdownModel.setSelectedItem(newValue);
              }
            },
            items: _items.map<DropdownMenuItem<String>>(
              (String value) {
                print(value.runtimeType);
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}

// List of items for the dropdown menu
List<String> _items = [
  'Select your preferred language',
  'Item 2',
  'Item 3',
  'Item 4'
];
