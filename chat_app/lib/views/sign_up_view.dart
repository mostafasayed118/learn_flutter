import 'package:chat_app/core/app_assets.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
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

  String? _validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'Please enter your email';
    if (!email.contains('@')) return 'Please enter a valid email';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    return null;
  }
static const routeNameSignUp = '/sign-up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      labelText: 'Password',
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      validator: _validatePassword,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(text: 'Sign up', onPressed: _signIn),
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
    );
  }
}
