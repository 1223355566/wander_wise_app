import 'package:flutter/cupertino.dart';

class SignInViewModel {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var signInFormKey = GlobalKey<FormState>();



  String? validateEmail(String? value) {
    // Regex pattern for email validation
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }
  String? validatePassword(String? value) {
    if (value!.isEmpty || value.length < 8) {
      return "Password is not valid";
    }
    return null;
  }

  void signUp() {
    print("signUp");
    if(signInFormKey.currentState!.validate()==false)return;
  }

  bool isAgree = false;
  bool showPassword = false;
  bool setIsAgree( bool value) {
    isAgree =! isAgree;
    return isAgree;
  }

  void disposeControllers() {

    emailController.dispose();
    passwordController.dispose();



  }

  void togglePasswordVisibility() {
    showPassword = !showPassword;
  }
}