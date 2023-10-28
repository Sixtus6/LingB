import 'package:flutter/material.dart';
import 'package:lingb/config/color.dart';
import 'package:lingb/config/size.dart';
import 'package:lingb/utils/constants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

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
        decoration: boxDecorationWithRoundedCorners(
            backgroundColor: Colors.grey.shade900),
        // padding: EdgeInsets.all(SizeConfigs.getPercentageWidth(40)),
        child: Column(
          children: [
            Row(
              children: [
                Container().expand(),
                const Icon(
                  Icons.cancel,
                  //size: 25,
                ).onTap(() {
                  finish(context);
                  roomIDController.text = widget.id;
                })
              ],
            ),
            2.height,
            Text(
              widget.id,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizeConfigs.getPercentageWidth(3).toInt().height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.copy,
                  color: ColorConfig.primary,
                  //size: 25,
                ).onTap(() {
                  copyToClipboard(widget.id);
                  toast("copied to clipboard");
                }),
                Icon(
                  Icons.share,
                  color: ColorConfig.primary,
                  //size: 25,
                ).onTap(() {
                  print("share");
                  Share.share(
                      'Join my chat-room, lets have a chat on LingB\n room id: ${widget.id}');
                })
              ],
            )
          ],
        ),
      ).withSize(
          height: SizeConfigs.getPercentageWidth(24),
          width: SizeConfigs.getPercentageWidth(100)),
    );
  }
}

void copyToClipboard(String text) {
  Clipboard.setData(ClipboardData(text: text));
}
