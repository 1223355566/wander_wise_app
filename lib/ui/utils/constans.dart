import 'package:flutter/material.dart';

abstract class AppConstants {
  static const double defaultPadding = 16.0;
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
