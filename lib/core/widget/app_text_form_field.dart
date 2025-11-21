import 'package:flutter/material.dart';
import 'package:m_one/core/extension/build_context.dart';
import 'package:m_one/core/providers/theme_provider.dart';
import 'package:m_one/core/theme/app_color_pallet.dart';
import 'package:m_one/core/theme/app_paddings.dart';
import 'package:m_one/core/theme/app_sizes.dart';
import 'package:provider/provider.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.width,
  });

  final String? hintText;
  final TextEditingController? controller;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final themeMode = context.read<ThemeProvider>().themeMode;

    return SizedBox(
      width: width ?? context.screenSize.width * 0.8,
      child: TextFormField(
        controller: controller,
        obscureText: false,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: themeMode == ThemeMode.dark
                    ? AppColorPallet.white
                    : AppColorPallet.black1),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusXl),
              borderSide: BorderSide(
                  color: themeMode == ThemeMode.dark
                      ? AppColorPallet.purple1
                      : Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusXl),
              borderSide: BorderSide(
                  color: themeMode == ThemeMode.dark
                      ? AppColorPallet.purple1
                      : Colors.black),
            ),
            
            contentPadding: (AppPaddings.verticalMd + AppPaddings.verticalSm) +
                AppPaddings.horizontalLg),
      ),
    );
  }
}
