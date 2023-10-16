import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lingb/config/color.dart';
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
      statusBarColor: ColorConfig.black, // Change the status bar color
      statusBarIconBrightness:
          Brightness.light, // Change the status bar icons' color
      systemNavigationBarColor: Colors.transparent,
      //   ColorConfig.black, // Change the navigation bar color
      systemNavigationBarIconBrightness:
          Brightness.light, // Change the navigation bar icons' color
    ));
    return Scaffold(
      body: Container(
        height: 200,
        width: double.infinity,
        decoration: boxDecorationWithRoundedCorners(
          // backgroundColor: Colors.amber,
          decorationImage: const DecorationImage(
              opacity: 0.7,
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover),
        ),

        // padding: EdgeInsets.all(8),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
