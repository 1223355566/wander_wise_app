import 'package:flutter/material.dart';
class RestPassViewModel {
  TextEditingController emailController = TextEditingController();
  var signupFormKey = GlobalKey<FormState>();
  String? validateEmail(String? value) {
    if (value!.isEmpty || value.length < 8) {
      return "Password is not valid";
    }
    return null;
  }

  void disposeControllers() {
    emailController.dispose();
  }
  void restPassword() {
    if(signupFormKey.currentState!.validate()==false)return;
    print("rest password");
  }
}