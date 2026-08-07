import 'package:chat_app/core/app_assets.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/validators.dart';
import 'package:chat_app/helper/showsnackbar.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/sign_up_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInView extends StatefulWidget {
  static String routeName = '/sign-in';

  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
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
                        text: 'Sign in to continue',
                        fontSize: 16,
                        color: AppColors.KBodyText,
                      ),
                      const SizedBox(height: 20),
                      CustomFormTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: validateEmail,
                      ),
                      const SizedBox(height: 20),
                      CustomFormTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        labelText: 'Password',
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        validator: _validatePassword,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'Sign in',
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              await _signIn();
                              if (!context.mounted) return;
                              showSnackBar(
                                context,
                                text: 'Signed in successfully!',
                              );
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                ChatView.routeName,
                                (route) => false,
                                arguments: _emailController.text.trim(),
                              );
                            } on FirebaseAuthException catch (e) {
                              if (!context.mounted) return;
                              final String message;
                              if (e.code == 'user-not-found' ||
                                  e.code == 'wrong-password') {
                                message = 'Invalid email or password.';
                              } else if (e.code == 'invalid-email') {
                                message = 'The email address is not valid.';
                              } else {
                                message =
                                    'Sign in failed. Please try again.';
                              }
                              showSnackBar(context, text: message);
                            } catch (_) {
                              if (!context.mounted) return;
                              showSnackBar(
                                context,
                                text:
                                    'Sign in failed. Please check your connection and try again.',
                              );
                            } finally {
                              if (context.mounted) {
                                setState(() {
                                  isLoading = false;
                                });
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
                            text: "Don't have an account? ",
                            fontSize: 16,
                            color: AppColors.KBodyText,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                SignUpView.routeNameSignUp,
                                arguments: 
                                   _emailController.text.trim(),
                                
                              );
                            },
                            child: const CustomText(
                              text: 'Sign up',
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
}
