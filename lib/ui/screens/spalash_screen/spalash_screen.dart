import 'package:flutter/material.dart';
import 'package:wander_wise_app/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:wander_wise_app/ui/utils/app_stings.dart';
import 'package:wander_wise_app/ui/utils/app_text_style.dart';

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({super.key});

  static const String routeName = "SpalashScreen";

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
    });

    // todo: check if user is logged in
    // if yes, go to home screen
    // if no, go to onboarding screen
    //todo:is frist time
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        AppStrings.appName,
        style: AppTextStyle.pacifico400Style64,
      )),
    );
  }
}
