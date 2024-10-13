import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wander_wise_app/ui/screens/Auth/signup/signup_screen.dart';
import 'package:wander_wise_app/ui/screens/on_boarding/on_boarding_view_modle.dart';
import 'package:wander_wise_app/ui/utils/app_color.dart';
import 'package:wander_wise_app/ui/utils/constans.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const String routeName = "OnBoardingScreen";
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  OnBoardingViewModle viewModle = OnBoardingViewModle();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                    height: AppConstants.screenHeight(context) * 0.5,
                    width: AppConstants.screenWidth(context),
                    child: AnimatedScale(
                        scale: viewModle.isIn ? 0 : 1,
                        duration: const Duration(milliseconds: 250),
                        child: Image.asset(
                          viewModle.images[viewModle.index],
                        ))),
                Expanded(
                  child: Center(
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          left: viewModle.isIn
                              ? AppConstants.screenWidth(context) + 100
                              : AppConstants.screenWidth(context) * .15,
                          duration: const Duration(milliseconds: 250),
                          child: Text(
                            viewModle.titles[viewModle.index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 255, 199, 59),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        right: viewModle.isIn
                            ? AppConstants.screenWidth(context) + 100
                            : 0,
                        duration: const Duration(milliseconds: 250),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: SizedBox(
                              width: AppConstants.screenWidth(context) * 0.85,
                              child: Text(
                                viewModle.subtitles[viewModle.index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 19, 54, 33),
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIndicator(active: viewModle.index == 0),
                    const SizedBox(width: 10),
                    CustomIndicator(active: viewModle.index == 1),
                    const SizedBox(width: 10),
                    CustomIndicator(active: viewModle.index == 2),
                  ],
                ),
                SizedBox(height: AppConstants.screenWidth(context) * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: viewModle.index == 2
                          ? () {
                              //todo:navigate to Register screen
                              Navigator.pushReplacementNamed(
                                  context, SignUpScreen.routeName);
                              viewModle.setIsVisted();
                            }
                          : () {
                              setState(() {
                                viewModle.index = 2;
                              });
                            },
                      child: Text(viewModle.index == 2 ? "Register" : "skip",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        AppColors.primaryColor,
                      )),
                      onPressed: viewModle.index == 2
                          ? () {
                              //todo:navigate to sing up screen
                              Navigator.pushReplacementNamed(
                                  context, SignUpScreen.routeName);
                              viewModle.setIsVisted();
                            }
                          : () {
                              setState(() {
                                viewModle.isIn = !viewModle.isIn;
                                viewModle.index = viewModle.index == 2
                                    ? 0
                                    : viewModle.index + 1;
                              });
                              Timer(const Duration(milliseconds: 300), () {
                                return setState(() {
                                  viewModle.isIn = !viewModle.isIn;
                                });
                              });
                            },
                      child: Text(
                        viewModle.index == 2 ? "login" : "Next",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  final bool active;
  const CustomIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active ? AppColors.deepBrownColor : Colors.grey,
      ),
      width: active ? 30 : 10,
      height: 10,
    );
  }
}
