import 'package:flutter/material.dart';
import 'package:m_one/core/theme/app_color_theme.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  AppTextTheme({required AppColorTheme colorTheme})
      : primaryTitle = TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: colorTheme.primary,
          letterSpacing: 0,
        ),
        title = TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: colorTheme.primary,
          letterSpacing: 0,
        ),
        description = TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: colorTheme.primary,
        ),
        textField = TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: colorTheme.primary,
        ),
        button = TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: colorTheme.primary,
          letterSpacing: 0.5,
        ),
        textFieldHint = TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: colorTheme.primary.withValues(alpha: .6),
        );

  final TextStyle primaryTitle;
  final TextStyle title;
  final TextStyle description;
  final TextStyle textField;
  final TextStyle textFieldHint;
  final TextStyle button;

  @override
  AppTextTheme copyWith() => this;

  @override
  AppTextTheme lerp(
    covariant ThemeExtension<AppTextTheme>? other,
    double t,
  ) =>
      this;

  static AppTextTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextTheme>()!;
  }
}
