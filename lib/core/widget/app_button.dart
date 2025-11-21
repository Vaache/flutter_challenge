import 'package:flutter/material.dart';
import 'package:m_one/core/extension/build_context.dart';
import 'package:m_one/core/theme/app_sizes.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.width,
      this.buttonColor = Colors.transparent, this.textStyle, required this.onLongPress});

  final String label;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final VoidCallback onLongPress;
  final Color buttonColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      onLongPress: onLongPress,
      child: Container(
          width: width,
          height: AppSizes.xxl * 2,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(AppSizes.xxl),
          ),
          child: Center(
            child: Text(label, style: textStyle ?? context.textTheme.button),
          )),
    );
  }
}
