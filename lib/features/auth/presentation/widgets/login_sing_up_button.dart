import 'package:flutter/material.dart';
import 'package:m_one/core/extension/build_context.dart';
import 'package:m_one/core/providers/theme_provider.dart';
import 'package:m_one/core/theme/app_color_pallet.dart';
import 'package:m_one/core/theme/app_sizes.dart';
import 'package:m_one/core/widget/app_button.dart';
import 'package:provider/provider.dart';

class LoginSingUpButton extends StatefulWidget {
  const LoginSingUpButton(
      {super.key,
      required this.pageController,
      required this.onAnimated,
      required this.currentPage,
      required this.onLongPressLogin,
      required this.onLongPressSignUp});

  final PageController pageController;
  final void Function(int) onAnimated;
  final VoidCallback onLongPressLogin;
  final VoidCallback onLongPressSignUp;
  final int currentPage;

  @override
  State<LoginSingUpButton> createState() => _LoginSingUpButtonState();
}

class _LoginSingUpButtonState extends State<LoginSingUpButton> {
  void _goToLogin() {
    widget.pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
    widget.onAnimated(0);
  }

  void _goToSignUp() {
    widget.pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
    widget.onAnimated(1);
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = context.read<ThemeProvider>().themeMode;

    return Container(
      width: context.screenSize.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        color: context.colorTheme.backgroundPrimaryColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: context.screenSize.width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radiusXl),
              color: widget.currentPage == 0
                  ? AppColorPallet.blue1
                  : Colors.transparent,
            ),
            child: AppButton(
              label: 'Login',
              onLongPress: widget.onLongPressLogin,
              onPressed: _goToLogin,
              textStyle: widget.currentPage == 0 || themeMode == ThemeMode.dark
                  ? null
                  : context.textTheme.button
                      .copyWith(color: AppColorPallet.black1),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: context.screenSize.width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radiusXl),
              color: widget.currentPage == 1
                  ? AppColorPallet.blue1
                  : Colors.transparent,
            ),
            child: AppButton(
              label: 'Sign-Up',
              onLongPress: widget.onLongPressSignUp,
              textStyle: widget.currentPage == 1 || themeMode == ThemeMode.dark
                  ? null
                  : context.textTheme.button
                      .copyWith(color: AppColorPallet.black1),
              onPressed: _goToSignUp,
            ),
          ),
        ],
      ),
    );
  }
}
