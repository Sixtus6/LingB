import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lingb/config/color.dart';
import 'package:lingb/config/size.dart';
import 'package:lingb/screens/chat_room/index.dart';
import 'package:lingb/screens/join_chat_room/provider.dart';
import 'package:lingb/utils/constants.dart';
import 'package:lingb/widget/dropdown.dart';
import 'package:lingb/widget/textfield.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: ColorConfig.black, // Change the status bar color
    //   statusBarIconBrightness:
    //       Brightness.light, // Change the status bar icons' color
    //   systemNavigationBarColor:
    //       ColorConfig.black, // Change the navigation bar color
    //   systemNavigationBarIconBrightness:
    //       Brightness.light, // Change the navigation bar icons' color
    // ));
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
                    topLeft: Radius.circular(75),
                    topRight: Radius.circular(75)),
                border: Border.all(
                  color: Colors.transparent, // Color of the border line
                  width: 0.5, // Thickness of the border line
                ),
              ),
              // height: SizeConfigs.getPercentageWidth(133),
              child: Padding(
                padding: EdgeInsets.all(SizeConfigs.getPercentageWidth(8)),
                child: Column(
                  children: [
                    SizeConfigs.getPercentageWidth(6).toInt().height,
                    CustomTextField(
                      icon: Icons.chat_rounded,
                      isEmail: false,
                      text: 'Chat Room ID',
                      myController: roomIDController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field cannot be empty';
                        }
                        return null;
                      },
                    ),
                    SizeConfigs.getPercentageWidth(6).toInt().height,
                    CustomTextField(
                      icon: Icons.person_4,
                      isEmail: false,
                      text: 'Username',
                      myController: userNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field cannot be empty';
                        }
                        return null;
                      },
                    ),
                    SizeConfigs.getPercentageWidth(6).toInt().height,
                    DropdownMenuWithDecoration(),
                    SizeConfigs.getPercentageWidth(18).toInt().height,
                    Container(
                      width: SizeConfigs.getPercentageWidth(85),
                      height: SizeConfigs.getPercentageWidth(18),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: ColorConfig.primary,
                            elevation: 10,
                            backgroundColor: ColorConfig.white,
                            foregroundColor: ColorConfig.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  34), // Adjust the radius here
                            ),
                          ),
                          onPressed: () {
                            ChatRoom(
                                    img:
                                        "https://images.generated.photos/5up69kRDRX1KuGSbcG54wE0M4UWeT5gdNoXDJElP7Is/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/OTYxMDYxLmpwZw.jpg",
                                    name: userNameController.text)
                                .launch(context);
                            //  JoinRoomScreen().launch(context, isNewTask: true);
                          },
                          child: const Text(
                            'Join',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          )),
                    ),
                    SizeConfigs.getPercentageWidth(16).toInt().height,
                    // Consumer<JoinRoomProvider>(
                    //     builder: (context, joinRoomProvider, _) {
                    //   return Text(
                    //       'Selected Item: ${joinRoomProvider.selectedItem}');
                    // }),
                  ],
                ),
              ),
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