import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lingb/config/color.dart';
import 'package:lingb/config/size.dart';
import 'package:lingb/config/socket/socket_method.dart';
import 'package:lingb/screens/chat_room/index.dart';
import 'package:lingb/screens/join_chat_room/create-room.dart';
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
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    _socketMethods.createRoomEvent(context);
    _socketMethods.joinRoomErrorListener(context);
    _socketMethods.joinRoomEvent(context);
    _socketMethods.chatRoomEvent(context);

    print("initilized");
    // TODO: implement initState
    super.initState();
  }

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
            Padding(
              padding: EdgeInsets.all(SizeConfigs.getPercentageWidth(5)),
              child: Lottie.asset(
                "assets/lottie/onboard4.json",
              ),
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
                    Column(
                      children: [
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
                        Row(
                          children: [
                            Container().expand(),
                            Consumer<JoinRoomProvider>(
                              builder: (BuildContext context, provider, _) {
                                return Text(
                                  'Create-Room',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorConfig.primary,
                                    fontSize: 13,
                                  ),
                                ).onTap(() async {
                                  try {
                                    _socketMethods.createRoom(context);
                                  } finally {
                                    // provider.myRefactoredFunction(context);
                                  }

                                  // roomIDController.text =
                                  //     "dskjhdkjshdkahdkjsdsahjkdsadhahdsa";
                                });
                              },
                            )
                          ],
                        )
                      ],
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
                            if (roomIDController.text.isEmptyOrNull) {
                              toast("Enter Valid ChatRoom ID");
                              return;
                            }
                            if (userNameController.text.isEmptyOrNull) {
                              toast("Enter Username");
                              return;
                            }
                            if (Provider.of<JoinRoomProvider>(context,
                                        listen: false)
                                    .selectedItem
                                    .toLowerCase() ==
                                "Select your preferred language"
                                    .toLowerCase()) {
                              toast("Select Prefered Language");
                              return;
                            }
                            _socketMethods.joinRoom(
                                userNameController.text, roomIDController.text);

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
                    // SizeConfigs.getPercentageWidth(1).toInt().height,
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