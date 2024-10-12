import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wander_wise_app/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:wander_wise_app/ui/utils/app_color.dart';
import 'package:wander_wise_app/ui/utils/app_stings.dart';
import 'package:wander_wise_app/ui/utils/app_text_style.dart';
import 'package:wander_wise_app/ui/utils/constans.dart';

class SpalashScreen extends StatelessWidget {
  const SpalashScreen({super.key});

  static const String routeName = "SpalashScreen";
  @override
  Widget build(BuildContext context) {
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
    // });
    return const Scaffold(
      body: Center(
          child: Text(
        AppStrings.appName,
        style: AppTextStyle.pacifico400Style64,
      )),
    );
  }
}
