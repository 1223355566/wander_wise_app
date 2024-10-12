import 'package:flutter/material.dart';
import 'package:wander_wise_app/ui/screens/Auth/auth.dart';
import 'package:wander_wise_app/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:wander_wise_app/ui/screens/spalash_screen/spalash_screen.dart';
import 'package:wander_wise_app/ui/utils/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Winder Wise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.secondaryColor,
        useMaterial3: true,
      ),
      routes: {
        SpalashScreen.routeName: (context) => const SpalashScreen(),
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        Auth.routeName: (context) => const Auth(),
      },
      initialRoute: SpalashScreen.routeName,
    );
  }
}
