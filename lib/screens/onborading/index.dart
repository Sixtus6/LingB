import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: boxDecorationWithRoundedCorners(),
        
        // padding: EdgeInsets.all(8),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
