import 'package:flutter/material.dart';
import 'package:lingb/config/color.dart';
import 'package:lingb/config/size.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/services.dart';

class CreateRoom extends StatefulWidget {
  final String id;
  CreateRoom({required this.id});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        // padding: EdgeInsets.all(SizeConfigs.getPercentageWidth(40)),
        child: Column(
          children: [
            Row(
              children: [
                Container().expand(),
                Icon(
                  Icons.cancel,
                  //size: 25,
                ).onTap(() {
                  finish(context);
                })
              ],
            ),
            2.height,
            Text(widget.id),
            SizeConfigs.getPercentageWidth(3).toInt().height,
            Icon(
              Icons.copy,
              color: ColorConfig.primary,
              //size: 25,
            ).onTap(() {
              copyToClipboard(widget.id);
              toast("copied to clipboard");
            })
          ],
        ),
        decoration: boxDecorationWithRoundedCorners(
            backgroundColor: Colors.grey.shade900),
      ).withSize(
          height: SizeConfigs.getPercentageWidth(20),
          width: SizeConfigs.getPercentageWidth(100)),
    );
  }
}

void copyToClipboard(String text) {
  Clipboard.setData(ClipboardData(text: text));
}
