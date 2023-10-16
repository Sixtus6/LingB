import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lingb/config/color.dart';
import 'package:lingb/config/size.dart';
import 'package:nb_utils/nb_utils.dart';

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
            height: SizeConfigs.getPercentageWidth(120),
            width: double.infinity,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       // opacity: 0.7,
            //       image: AssetImage("assets/icon/bg.png"),
            //       fit: BoxFit.cover),
            // ),

            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: Colors.black,
              decorationImage: const DecorationImage(
                  // opacity: 0.7,
                  image: AssetImage("assets/icon/bg.png"),
                  fit: BoxFit.cover),
            ),

            // padding: EdgeInsets.all(8),
            child: Row(
              children: [Text("LingB")],
            ),
          ),
        ],
      ),
    );
  }
}
