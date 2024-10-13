import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

bool isPassword ;
String? Function(String?)? validator;
String labelText;
Widget? suffixIcon;
TextInputType keyboardType;
TextInputAction textInputAction;
TextEditingController? controller;
CustomTextFormField(
{
 this.isPassword=false, required this.labelText,   this.suffixIcon,
required this.keyboardType, this.controller,this.validator, required  this.textInputAction
});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator:validator ,
      controller:controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      textInputAction:textInputAction ,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
