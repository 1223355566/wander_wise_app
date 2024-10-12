import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wander_wise_app/ui/screens/Auth/auth.dart';
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
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  @override
  initState() {
    checkIfFirstTime(prefs, context);
    super.initState();

    // todo: check if user is logged in
    // if yes, go to home screen
    // if no, go to onboarding screen
    //todo:is frist time
    // if no go to signup screen or login screen
    // if yes go into onboarding screen
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

void checkIfFirstTime(
    Future<SharedPreferences> prefs, BuildContext context) async {
  prefs.then((SharedPreferences prefs) {
    bool isFirstTime = prefs.getBool('isVisted') == true;
    print("isFirstTime: $isFirstTime");
    if (!isFirstTime) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, Auth.routeName);
      });
    }
  });
}
