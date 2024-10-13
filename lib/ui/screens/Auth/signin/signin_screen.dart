import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_wise_app/ui/screens/Auth/signin/signin_view_modle.dart';
import '../../../utils/app_assets.dart';
import '../Auth_widgets/coustem_text_form_fild.dart';
import '../rest_password/rest_password_screen.dart';
import '../signup/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "SignInScreen";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInViewModel viewModel = SignInViewModel();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Dispose controllers to free up resources
    viewModel.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,
          child: Expanded(
            child: Column(
              children: [
                // Top brown section with logo
                Container(
                  height: size.height * 0.4,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD9B99B),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // The top text and logo
                      Positioned(
                        top: size.height * 0.08,
                        child:   Text(
                          'WanderWise',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ),

                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: SvgPicture.asset(
                          Assets.assetsImagesPyramids,
                          height: size.height * 0.1,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SvgPicture.asset(
                          Assets.assetsImagesGam3,
                          height: size.height * 0.1,
                        ),
                      ),
                    ],
                  ),
                ),

                // Form section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'Welcome Back!',
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Email Address TextField
                        CustomTextFormField(
                          labelText: 'Email Address',
                          keyboardType: TextInputType.emailAddress,
                          controller: viewModel.emailController,
                          validator: viewModel.validateEmail,
                          textInputAction: TextInputAction.next,
                          suffixIcon: const Icon(Icons.email_outlined),
                        ),
                        const SizedBox(height: 20),

                        // Password TextField
                        CustomTextFormField(
                          labelText: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: viewModel.showPassword,
                          controller: viewModel.passwordController,
                          validator: viewModel.validatePassword,
                          textInputAction: TextInputAction.next,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                viewModel.togglePasswordVisibility();
                              });
                            },
                            child: Icon(
                              viewModel.showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Forgot Password link
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to forgot password screen
                             Timer(const Duration(milliseconds: 200), () {
                               Navigator.pushNamed(context, RestPasswordScreen.routeName);
                             });
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Color(0xFF8C716A),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Sign In Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {


                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFCEA27F),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Sign Up Link
                        Center(
                          child: TextButton(
                            onPressed: () {
                              // Navigate to Sign Up screen
                              Navigator.pushNamed(context, SignUpScreen.routeName);
                            },
                            child: RichText(
                              text: const TextSpan(
                                text: 'Don\'t have an account? ',
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'Sign up',
                                    style: TextStyle(
                                      color: Color(0xFF8C716A),
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
