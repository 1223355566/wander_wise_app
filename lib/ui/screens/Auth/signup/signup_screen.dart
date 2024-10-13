import 'package:flutter/material.dart';
import 'package:wander_wise_app/ui/screens/Auth/signup/signup_view_modle.dart';
import '../Auth_widgets/coustem_text_form_fild.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "SignUpScreen";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpViewModel viewModel = SignUpViewModel();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Dispose controllers to free up resources
    viewModel.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                // Removed Expanded to prevent layout issues
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.1),
                  const Center(
                    child: Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    labelText: 'First Name',
                    keyboardType: TextInputType.name,
                    controller: viewModel.fristNameController,
                    validator: viewModel.validateFristName,
                    suffixIcon: const Icon( Icons.person_outline),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    labelText: 'Last Name',
                    keyboardType: TextInputType.name,
                    controller: viewModel.lastNameController,
                    validator: viewModel.validateLastName,
                    suffixIcon: const Icon( Icons.person_outline),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    labelText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    controller: viewModel.emailController,
                    validator: viewModel.validateEmail,
                    suffixIcon:const Icon(Icons.email_outlined),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20),
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
                  Row(
                    children: [
                      Checkbox(
                        value: viewModel.isAgree,
                        onChanged: (value) {
                          setState(() {
                            viewModel.setIsAgree(value ?? false);
                          });
                        },
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Handle terms and conditions tap
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: 'I agree to our ',
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Terms and Conditions',
                                  style: TextStyle(
                                    color: Colors.brown,
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
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (viewModel.isAgree) {
                            viewModel.signUp();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                Text('You must agree to terms first.'),
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFCEA27F),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Navigate to Sign In screen
                        Navigator.pushNamed(context, "SignInScreen");
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                color: Colors.brown,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}