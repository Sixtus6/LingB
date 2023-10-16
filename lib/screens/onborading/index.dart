import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lingb/config/color.dart';
import 'package:lingb/config/size.dart';
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
