import 'package:flutter/material.dart';

class AppTextThemeExtension extends ThemeExtension<AppTextThemeExtension> {
  const AppTextThemeExtension({
    required this.displayLarge64,
    required this.displayMedium56,
    required this.displaySmall48,
    required this.headlineLarge40,
    required this.headlineMedium32,
    required this.headlineSmall30,
    required this.titleLarge28,
    required this.titleMedium26,
    required this.titleSmall24,
    required this.bodyLarge18,
    required this.bodyMedium16,
    required this.bodySmall14,
    required this.labelLarge12,
    required this.cook,
    required this.labelLarge10,
    required this.labelLarge8,
  });

  final TextStyle displayLarge64;
  final TextStyle displayMedium56;
  final TextStyle displaySmall48;
  final TextStyle headlineLarge40;
  final TextStyle headlineMedium32;
  final TextStyle headlineSmall30;
  final TextStyle titleLarge28;
  final TextStyle titleMedium26;
  final TextStyle titleSmall24;
  final TextStyle bodyLarge18;
  final TextStyle bodyMedium16;
  final TextStyle bodySmall14;
  final TextStyle labelLarge12;
  final TextStyle labelLarge10;
  final TextStyle labelLarge8;
  final TextStyle cook;

  @override
  ThemeExtension<AppTextThemeExtension> copyWith({
  TextStyle? displayLarge64,
   TextStyle? displayMedium56,
   TextStyle? displaySmall48,
   TextStyle? headlineLarge40,
   TextStyle? headlineMedium32,
   TextStyle? headlineSmall30,
   TextStyle? titleLarge28,
   TextStyle? titleMedium26,
   TextStyle? titleSmall24,
   TextStyle? bodyLarge18,
   TextStyle? bodyMedium16,
   TextStyle? bodySmall14,
   TextStyle? labelLarge12,
   TextStyle? cook,
   TextStyle? labelLarge10,
   TextStyle? labelLarge8,
  }) {
    return AppTextThemeExtension(
      displayLarge64: displayLarge64 ?? this.displayLarge64,
      displayMedium56: displayMedium56 ?? this.displayMedium56,
      displaySmall48: displaySmall48 ?? this.displaySmall48,
      headlineLarge40: headlineLarge40 ?? this.headlineLarge40,
      headlineMedium32: headlineMedium32 ?? this.headlineMedium32,
      headlineSmall30: headlineSmall30 ?? this.headlineSmall30,
      titleLarge28: titleLarge28 ?? this.titleLarge28,
      titleMedium26: titleMedium26 ?? this.titleMedium26,
      titleSmall24: titleSmall24 ?? this.titleSmall24,
      bodyLarge18: bodyLarge18 ?? this.bodyLarge18,
      bodyMedium16: bodyMedium16 ?? this.bodyMedium16,
      bodySmall14: bodySmall14 ?? this.bodySmall14,
      labelLarge12: labelLarge12 ?? this.labelLarge12,
      cook: cook ?? this.cook,
      labelLarge10: labelLarge10 ?? this.labelLarge10,
      labelLarge8: labelLarge8 ?? this.labelLarge8,
    );
  }

  @override
  ThemeExtension<AppTextThemeExtension> lerp(
    covariant ThemeExtension<AppTextThemeExtension>? other,
    double t,
  ) {
    if (other is! AppTextThemeExtension) {
      return this;
    }

    return AppTextThemeExtension(
      displayLarge64: TextStyle.lerp(displayLarge64, other.displayLarge64, t)!,
      displayMedium56: TextStyle.lerp(displayMedium56, other.displayMedium56, t)!,
      displaySmall48: TextStyle.lerp(displaySmall48, other.displaySmall48, t)!,
      headlineLarge40: TextStyle.lerp(headlineLarge40, other.headlineLarge40, t)!,
      headlineMedium32: TextStyle.lerp(headlineMedium32, other.headlineMedium32, t)!,
      headlineSmall30: TextStyle.lerp(headlineSmall30, other.headlineSmall30, t)!,
      titleLarge28: TextStyle.lerp(titleLarge28, other.titleLarge28, t)!,
      titleMedium26: TextStyle.lerp(titleMedium26, other.titleMedium26, t)!,
      titleSmall24: TextStyle.lerp(titleSmall24, other.titleSmall24, t)!,
      bodyLarge18: TextStyle.lerp(bodyLarge18, other.bodyLarge18, t)!,
      bodyMedium16: TextStyle.lerp(bodyMedium16, other.bodyMedium16, t)!,
      bodySmall14: TextStyle.lerp(bodySmall14, other.bodySmall14, t)!,
      labelLarge12: TextStyle.lerp(labelLarge12, other.labelLarge12, t)!,
      cook: TextStyle.lerp(cook, other.cook, t)!,
      labelLarge10: TextStyle.lerp(labelLarge10, other.labelLarge10, t)!,
      labelLarge8: TextStyle.lerp(labelLarge8, other.labelLarge8, t)!,
    );
  }
}