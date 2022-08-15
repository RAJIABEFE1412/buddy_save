import 'dart:async';

import 'package:buddy_save/style/style.dart';
import 'package:buddy_save/values/routes.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class BuddySplash extends StatelessWidget {
  const BuddySplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BuddyColors.primary,
      body: Center(
        child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Buddy Save!',
                  curve: Curves.ease,
                  cursor: "🖋",
                  textStyle: BuddyTextStyle.bold.copyWith(
                    color: BuddyColors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 500),
                ),
              ],
              onFinished: () {
                Navigator.pushReplacementNamed(
                  context,
                  BuddyRoutes.onboarding,
                );
              },
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 200),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
      ),
    );
  }
}
