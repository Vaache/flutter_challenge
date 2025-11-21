import 'package:flutter/material.dart';

class AppColorTheme implements ThemeExtension<AppColorTheme> {
  AppColorTheme({
    required this.brightness,
    required this.primary,
    required this.backgroundPrimaryColor,
    required this.foregroundPrimaryColor,
  });

  final Brightness brightness;
  final Color primary;
  final Color backgroundPrimaryColor;
  final Color foregroundPrimaryColor;

  @override
  ThemeExtension<AppColorTheme> copyWith({
    Color? primary,
    Color? backgroundPrimaryColor,
    Color? foregroundPrimaryColor,
    Color? foregroundSecondaryColor,
    Color? panelBackgroundPrimaryColor,
    Color? panelBackgroundSecondaryColor,
    Color? panelBackgroundTertiaryColor,
  }) {
    return AppColorTheme(
      brightness: brightness,
      primary: primary ?? this.primary,
      backgroundPrimaryColor: backgroundPrimaryColor ?? this.backgroundPrimaryColor,
      foregroundPrimaryColor: foregroundPrimaryColor ?? this.foregroundPrimaryColor,
    );
  }

  @override
  ThemeExtension<AppColorTheme> lerp(
    covariant ThemeExtension<AppColorTheme>? other,
    double t,
  ) {
    if (other is! AppColorTheme) {
      return this;
    }

    return AppColorTheme(
      brightness: t < 0.5 ? brightness : other.brightness,
      primary: Color.lerp(primary, other.primary, t)!,
      backgroundPrimaryColor: Color.lerp(backgroundPrimaryColor, other.backgroundPrimaryColor, t)!,
      foregroundPrimaryColor: Color.lerp(foregroundPrimaryColor, other.foregroundPrimaryColor, t)!,
    );
  }

  @override
  Object get type => AppColorTheme;

  static AppColorTheme of(BuildContext context) {
    return Theme.of(context).extension<AppColorTheme>()!;
  }
}
