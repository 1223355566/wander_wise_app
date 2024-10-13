import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_wise_app/ui/screens/Auth/rest_password/rest_pass_view_model.dart';
import 'package:wander_wise_app/ui/screens/Auth/signin/signin_view_modle.dart';
import '../../../utils/app_assets.dart';
import '../Auth_widgets/coustem_text_form_fild.dart';
import '../signup/signup_screen.dart';

class RestPasswordScreen extends StatefulWidget {
  static const String routeName = "RestPasswordScreen";
  const RestPasswordScreen({super.key});

  @override
  State<RestPasswordScreen> createState() => _RestPasswordScreenState();
}

class _RestPasswordScreenState extends State<RestPasswordScreen> {
  final RestPassViewModel viewModel = RestPassViewModel();
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
                    child: Text(
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
                        'Reset Password!',
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
                      suffixIcon: const Icon(Icons.email_outlined),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 40),
                    // Sign In Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.restPassword();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFCEA27F),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Send',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    // Sign Up Link
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
