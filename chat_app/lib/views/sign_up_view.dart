import 'dart:developer';

import 'package:chat_app/core/app_assets.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/validators.dart';
import 'package:chat_app/helper/showsnackbar.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatefulWidget {
  static String routeNameSignUp = '/sign-up';
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    FocusScope.of(context).unfocus();
    _formKey.currentState?.validate();
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    if (value.length < 6) return 'Password must be at least 6 characters long';
    return null;
  }

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Image.asset(
                        AppAssets.logo,
                        height: 220,
                        fit: BoxFit.contain,
                      ),
                      const CustomText(
                        text: 'Welcome to Chat App',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.KOnPrimary,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const CustomText(
                        text: 'Sign up to continue',
                        fontSize: 16,
                        color: AppColors.KBodyText,
                      ),
                      const SizedBox(height: 20),
                      CustomFormTextField(
                        onSaved: (value) {
                          _emailController.text = value ?? '';
                        },
                        controller: _emailController,
                        hintText: 'Email',
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: validateEmail,
                      ),
                      const SizedBox(height: 20),
                      CustomFormTextField(
                        onSaved: (value) {
                          _passwordController.text = value ?? '';
                        },
                        controller: _passwordController,
                        hintText: 'Password',
                        labelText: 'Password',
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        validator: _validatePassword,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'Sign up',
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            setState(() => _isLoading = true);
                            _formKey.currentState?.save();
                            try {
                              final userCredential = await SignUp();
                              log(
                                'User signed up: ${userCredential.user?.uid}',
                              );
                              if (!context.mounted) return;
                              showSnackBar(
                                context,
                                text: 'Sign up successful!',
                              );
                              Navigator.pushNamed(
                                context,
                                ChatView.routeName,
                                arguments: _emailController.text.trim(),
                              );
                            } on FirebaseAuthException catch (e) {
                              if (!context.mounted) return;
                              final String message;
                              if (e.code == 'weak-password') {
                                message =
                                    'The password provided is too weak.';
                              } else if (e.code == 'email-already-in-use') {
                                message =
                                    'The account already exists for that email.';
                              } else {
                                message =
                                    'Sign up failed. Please try again.';
                              }
                              showSnackBar(context, text: message);
                            } catch (e) {
                              if (!context.mounted) return;
                              log('Sign up failed: $e');
                              showSnackBar(
                                context,
                                text:
                                    'An unexpected error occurred. Please try again.',
                              );
                            } finally {
                              if (context.mounted) {
                                setState(() => _isLoading = false);
                              }
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const CustomText(
                            text: "I have an account ",
                            fontSize: 16,
                            color: AppColors.KBodyText,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const CustomText(
                              text: 'Sign In',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.KPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> SignUp() async {
    var auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    return userCredential;
  }
}
