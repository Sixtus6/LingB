import 'package:flutter/material.dart';
import 'package:lingb/config/color.dart';
import 'package:lingb/config/size.dart';
import 'package:lingb/screens/join_chat_room/provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class DropdownMenuWithDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<JoinRoomProvider>(
      builder: (context, dropdownModel, _) {
        return Container(
          padding: EdgeInsets.only(
              left: SizeConfigs.getPercentageWidth(13),
              right: SizeConfigs.getPercentageWidth(13)),
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorConfig.secondary.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(25.0),
          ),
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
                  print(value.runtimeType);
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
    );
  }
}

// List of items for the dropdown menu
List<String> _items = [
  'Select your preferred language',
  'Hausa',
  'Igbo',
  'French'
];
