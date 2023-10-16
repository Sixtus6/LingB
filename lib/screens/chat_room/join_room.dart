import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lingb/config/color.dart';
import 'package:lingb/config/size.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorConfig.black, // Change the status bar color
      statusBarIconBrightness:
          Brightness.light, // Change the status bar icons' color
      systemNavigationBarColor:
          ColorConfig.black, // Change the navigation bar color
      systemNavigationBarIconBrightness:
          Brightness.light, // Change the navigation bar icons' color
    ));
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            SizeConfigs.getPercentageWidth(1).toInt().height,
            Lottie.asset(
              "assets/lottie/onboard1.json",
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfigs.getPercentageWidth(8)),
              child: const Text(
                "Join Chat Room",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration: boxDecorationWithRoundedCorners(
                backgroundColor: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(55),
                    topRight: Radius.circular(55)),
                border: Border(
                  top: BorderSide(
                    color: Colors.red, // Color of the top border line
                    width: 2.0,

                    // Thickness of the top border line
                  ),
                ),
              ),
              height: SizeConfigs.getPercentageWidth(134),
            ),
          ],
        ),
      )),
    );
  }
}



// Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 opacity: 0.7,
//                 image: AssetImage("assets/icon/lingb.png"),
//                 fit: BoxFit.cover)),
//         child: const SafeArea(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [],
//         )),
//       ),