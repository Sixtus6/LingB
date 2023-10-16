import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lingb/config/color.dart';
import 'package:lingb/config/size.dart';
import 'package:lingb/screens/chat_room/join_room.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Change the status bar color
      statusBarIconBrightness:
          Brightness.light, // Change the status bar icons' color
      systemNavigationBarColor:
          ColorConfig.black, // Change the navigation bar color
      systemNavigationBarIconBrightness:
          Brightness.light, // Change the navigation bar icons' color
    ));
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: SizeConfigs.getPercentageWidth(123),
            width: double.infinity,
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              backgroundColor: Colors.black,
              decorationImage: const DecorationImage(
                  // opacity: 0.7,
                  image: AssetImage("assets/icon/bg.png"),
                  fit: BoxFit.cover),
            ),

            // padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("").expand(),
                    Padding(
                      padding:
                          EdgeInsets.all(SizeConfigs.getPercentageWidth(14)),
                      child: const Text(
                        "Ling B",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(SizeConfigs.getPercentageWidth(6)),
            child: Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.blue.shade100,
                        child: const Text(
                          'Communicate',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.blue.shade100,
                        child: const Text(
                          'easily without',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.blue.shade100,
                        child: const Text(
                          'language barrier',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizeConfigs.getPercentageWidth(4).toInt().height,
                      Row(
                        children: [
                          Image.asset(
                            "assets/icon/check.png",
                            height: 25,
                            width: 25,
                            // color: ColorConfig.red,
                          ),
                          const Text(
                            ' ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const Text(
                            'Secure, private messaging',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizeConfigs.getPercentageWidth(10).toInt().height,
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
                              JoinRoomScreen().launch(context, isNewTask: true);
                            },
                            child: const Text(
                              'Get Started',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          // RichText(
          //   text: TextSpan(
          //     style: TextStyle(
          //       color: ColorConfig.secondary,
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //     ),
          //     children: <TextSpan>[
          //       TextSpan(
          //         text: "Welcome To",
          //         //  style: TextStyle(color: Colors.black.withOpacity(0.6)),
          //       ),
          //       TextSpan(
          //         text: " MUUV.",
          //         style: TextStyle(color: ColorConfig.primary),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
