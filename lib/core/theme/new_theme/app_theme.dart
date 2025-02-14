import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:demo_app/core/theme/new_theme/app_typography.dart';
import 'package:demo_app/core/theme/new_theme/them_extention.dart';

import 'app_color.dart';
import 'app_text_theme_extention.dart';

class AppTheme {
  //
  // Light theme
  //

  static final light = () {
    final defaultTheme = ThemeData.light();

    return defaultTheme.copyWith(
      textTheme: defaultTheme.textTheme.copyWith(
        // Default text style for Text widget.
        bodyMedium: AppTypography.body1.copyWith(color: Colors.black),
      ),
      extensions: [
        _lightAppColors,
        _lightTextTheme,
      ],
    );
  }();

  static final _lightAppColors = AppColorsExtension(
    primary: AppPalette.primary.primary400,
    onPrimary: AppPalette.white,
    secondary: AppPalette.lime1.lime400,
    onSecondary: AppPalette.white,
    error: AppPalette.red.red500,
    onError: AppPalette.red.red500,
    background: AppPalette.white,
    onBackground: AppPalette.white,
    surface: AppPalette.white,
    onSurface: AppPalette.white,
    textColor: AppPalette.black,
  );

  static final _lightTextTheme = AppTextThemeExtension(
    displayLarge64: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 64.sp),
    displayMedium56: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 56.sp),
    displaySmall48: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 48.sp),
    headlineLarge40: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 40.sp),
    headlineMedium32: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 32.sp),
    headlineSmall30: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 30.sp),
    titleLarge28: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 28.sp),
    titleMedium26: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 26.sp),
    titleSmall24: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 24.sp),
    bodyLarge18: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 18.sp),
    bodyMedium16: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 16.sp),
    bodySmall14: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 14.sp),
    labelLarge12: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 12.sp),

    cook: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 8.sp),
    labelLarge10: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 10.sp),
    labelLarge8: AppTypography.body1
        .copyWith(color: _lightAppColors.textColor, fontSize: 8.sp),

    // body1: AppTypography.body1.copyWith(color: _darkAppColors.onBackground),
    //h1: AppTypography.h1.copyWith(color: Colors.white),
  );

  //
  // Dark theme
  //

  static final dark = () {
    final defaultTheme = ThemeData.dark();

    return defaultTheme.copyWith(
      textTheme: defaultTheme.textTheme.copyWith(
        // Default text style for Text widget.
        bodyMedium: AppTypography.body1.copyWith(color: Colors.white),
      ),
      extensions: [
        _darkAppColors,
        _darkTextTheme,
      ],
    );
  }();

  static final _darkAppColors = AppColorsExtension(
    primary: AppPalette.primary.primary400,
    onPrimary: AppPalette.white,
    secondary: AppPalette.lime1.lime400,
    onSecondary: AppPalette.primary.primary400,
    error: AppPalette.red.red300,
    onError: AppPalette.red.red400,
    background: AppPalette.black,
    onBackground: AppPalette.black,
    surface: AppPalette.black,
    onSurface: AppPalette.black,
    textColor: AppPalette.white,
  );

  static final _darkTextTheme = AppTextThemeExtension(
    displayLarge64: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 64.sp),
    displayMedium56: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 56.sp),
    displaySmall48: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 48.sp),
    headlineLarge40: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 40.sp),
    headlineMedium32: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 32.sp),
    headlineSmall30: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 30.sp),
    titleLarge28: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 28.sp),
    titleMedium26: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 26.sp),
    titleSmall24: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 24.sp),
    bodyLarge18: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 18.sp),
    bodyMedium16: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 16.sp),
    bodySmall14: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 14.sp),
    labelLarge12: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 12.sp),
    cook: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 8.sp),
    labelLarge10: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 10.sp),
    labelLarge8: AppTypography.body1
        .copyWith(color: _darkAppColors.textColor, fontSize: 8.sp),
    // body1: AppTypography.body1.copyWith(color: _darkAppColors.onBackground),
    //h1: AppTypography.h1.copyWith(color: Colors.white),
  );
}

/// Here you should define getters for your `ThemeExtension`s.
///
/// Never use `Theme.of(context).extension<MyColors>()!`
/// how they do it in the [official documentation](https://api.flutter.dev/flutter/material/ThemeExtension-class.html),
/// because it's not safe. Always create a getter for your `ThemeExtension` and use it instead.
///
/// Usage example: `Theme.of(context).appColors`.
extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;

  AppTextThemeExtension get appTextTheme =>
      extension<AppTextThemeExtension>() ?? AppTheme._lightTextTheme;
}

/// A more convenient way to get `ThemeData` from the `BuildContext`.
///
/// Usage example: `context.theme`.
extension ThemeGetter on BuildContext {
  ThemeData get myTheme => Theme.of(this);
}
