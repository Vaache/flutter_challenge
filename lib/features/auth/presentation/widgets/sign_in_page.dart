import 'package:flutter/material.dart';
import 'package:m_one/core/extension/build_context.dart';
import 'package:m_one/core/widget/app_text_form_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    super.key,
    required this.userNameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              AppTextFormField(
                
                  controller: widget.emailController, hintText: 'Email'),
              SizedBox(height: context.screenSize.height * 0.01),
              AppTextFormField(
                  controller: widget.userNameController, hintText: 'Username'),
              SizedBox(height: context.screenSize.height * 0.01),
              AppTextFormField(
                controller: widget.passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
            ],
          ),
        )
      ],
    );
  }
}
