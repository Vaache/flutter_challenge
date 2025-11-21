import 'package:flutter/material.dart';
import 'package:m_one/core/theme/app_color_pallet.dart';
import 'package:m_one/core/theme/app_color_theme.dart';
import 'package:m_one/core/theme/app_text_theme.dart';
class AppTheme {
  static ThemeData light() {
    final appColorTheme = _lightAppColorTheme();
    final appTextTheme = AppTextTheme(colorTheme: appColorTheme);

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: appColorTheme.backgroundPrimaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: appColorTheme.backgroundPrimaryColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: appColorTheme.backgroundPrimaryColor,
      ),
      extensions: [appColorTheme, appTextTheme],
    );
  }

  static AppColorTheme _lightAppColorTheme() {
    return AppColorTheme(
      brightness: Brightness.light,
      primary: AppColorPallet.white,
      backgroundPrimaryColor: AppColorPallet.blue2,
      foregroundPrimaryColor: AppColorPallet.white,
    );
  }

  static ThemeData dark() {
    final appColorTheme = _darkAppColorTheme();
    final appTextTheme = AppTextTheme(colorTheme: appColorTheme);

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: appColorTheme.backgroundPrimaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: appColorTheme.backgroundPrimaryColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: appColorTheme.backgroundPrimaryColor,
      ),
      extensions: [appColorTheme, appTextTheme],
    );
  }

  static AppColorTheme _darkAppColorTheme() {
    return AppColorTheme(
      brightness: Brightness.dark,
      primary: AppColorPallet.white,
      backgroundPrimaryColor: AppColorPallet.black2,
      foregroundPrimaryColor: AppColorPallet.black1
    
    );
  }
}
