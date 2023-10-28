import 'package:flutter/material.dart';
import 'package:lingb/config/color.dart';
import 'package:lingb/config/size.dart';
import 'package:nb_utils/nb_utils.dart';

class CreateRoom extends StatefulWidget {
  const CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      child: Container(
        // padding: EdgeInsets.all(SizeConfigs.getPercentageWidth(40)),

        decoration:
            boxDecorationWithRoundedCorners(backgroundColor: ColorConfig.black),
      ).withSize(
          height: SizeConfigs.getPercentageWidth(13),
          width: SizeConfigs.getPercentageWidth(50)),
    );
  }
}
