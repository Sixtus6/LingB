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
            height: SizeConfigs.getPercentageWidth(123),
            width: double.infinity,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       // opacity: 0.7,
            //       image: AssetImage("assets/icon/bg.png"),
            //       fit: BoxFit.cover),
            // ),

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
                //  SizeConfigs.getPercentageWidth(7).toInt().height,
                Row(
                  children: [
                    Text("").expand(),
                    Padding(
                      padding:
                          EdgeInsets.all(SizeConfigs.getPercentageWidth(14)),
                      child: Text(
                        "Ling B",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
