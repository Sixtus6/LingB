import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lingb/config/color.dart';
import 'package:lingb/config/size.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

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
            SizeConfigs.getPercentageWidth(2).toInt().height,
            Lottie.asset(
              "assets/lottie/onboard1.json",
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfigs.getPercentageWidth(8)),
              child: Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.grey.shade600,
                child: Text(
                  "Join Chat Room",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              decoration: boxDecorationWithRoundedCorners(
                backgroundColor: Colors.white10.withOpacity(0.1),
                // decorationImage: DecorationImage(
                //     opacity: 0.7,
                //     image: AssetImage("assets/icon/lingb.png"),
                //     fit: BoxFit.cover),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(55),
                    topRight: Radius.circular(55)),
                border: Border.all(
                  color: Colors.transparent, // Color of the border line
                  width: 0.5, // Thickness of the border line
                ),
              ),
              height: SizeConfigs.getPercentageWidth(133),
            ),
          ],
        ),
      )),
    );
  }
}

// child: Container(
//                 margin: EdgeInsets.only(top: SizeConfigs.getPercentageWidth(1)),
//                 decoration: const BoxDecoration(
//                   color: Colors.transparent,
//                   // backgroundColor: Colors.transparent,
//                   image: DecorationImage(
//                       opacity: 0.7,
//                       image: AssetImage("assets/icon/lingb.png"),
//                       fit: BoxFit.cover),
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(55),
//                       topRight: Radius.circular(55)),

//                   // border: Border.all(
//                   //   color: Colors.red, // Color of the border line
//                   //   width: 0.5, // Thickness of the border line
//                   // ),
//                 ),
//               )
//                   .withHeight(SizeConfigs.getPercentageWidth(133))
//                   .withWidth(double.infinity),


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

// Container(
//               decoration: boxDecorationWithRoundedCorners(
//                 backgroundColor: Colors.transparent,
//                 decorationImage: DecorationImage(
//                     opacity: 0.7,
//                     image: AssetImage("assets/icon/lingb.png"),
//                     fit: BoxFit.cover),
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(55),
//                     topRight: Radius.circular(55)),
//                 border: Border.all(
//                   color: Colors.red, // Color of the border line
//                   width: 0.5, // Thickness of the border line
//                 ),
//               ),
//               height: SizeConfigs.getPercentageWidth(133),
//             ),