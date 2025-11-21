import 'package:flutter/material.dart';
import 'package:m_one/core/theme/app_color_theme.dart';
import 'package:m_one/core/theme/app_text_theme.dart';

extension BuildContextX on BuildContext {
  AppColorTheme get colorTheme => AppColorTheme.of(this);

  AppTextTheme get textTheme => AppTextTheme.of(this);

  Size get screenSize => MediaQuery.of(this).size;

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  void showSnackBar(SnackBar snackBar) =>
      scaffoldMessenger.showSnackBar(snackBar);
}
