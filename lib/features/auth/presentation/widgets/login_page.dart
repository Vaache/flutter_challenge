import 'package:flutter/material.dart';
import 'package:m_one/core/extension/build_context.dart';
import 'package:m_one/core/widget/app_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(
      {super.key,
      required this.userNameController,
      required this.passwordController});

  final TextEditingController userNameController;
  final TextEditingController passwordController;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
                  controller: widget.userNameController, hintText: 'Username'),
              SizedBox(height: context.screenSize.height * 0.01),
              AppTextFormField(
                controller: widget.passwordController,
                hintText: 'Password',
              ),
              SizedBox(height: context.screenSize.height * 0.03),
            ],
          ),
        ),
      ],
    );
  }
}
