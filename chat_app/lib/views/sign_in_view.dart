import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      body: Flexible(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(image: AssetImage('assets/images/logo.png')),
                CustomText(
                  text: 'Welcome to Chat App',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]!,
                ),
                SizedBox(height: 20),
                CustomText(
                  text: 'Sign in to continue',
                  fontSize: 16,
                  // fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[700]!,
                ),
                CustomTextField(
                  hintText: 'Email',
                  labelText: 'Email',
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Password',
                  labelText: 'Password',
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                CustomButton(onPressed: () {}),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Don\'t have an account? ',
                      fontSize: 16,
                      color: Colors.blueGrey[700]!,
                    ),
                    CustomText(
                      text: 'Sign up',
                      fontSize: 16,
                      color: Colors.blueAccent[700]!,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
