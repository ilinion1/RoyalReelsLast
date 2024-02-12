import 'package:flutter/material.dart';

class AppTextTheme extends TextTheme {
  const AppTextTheme({
    super.bodySmall,
    super.bodyMedium,
    super.bodyLarge,
    super.displaySmall,
    super.displayMedium,
    super.displayLarge,
    super.headlineSmall,
    super.headlineMedium,
    super.headlineLarge,
    super.labelSmall,
    super.labelMedium,
    super.labelLarge,
    super.titleSmall,
    super.titleMedium,
    super.titleLarge,
    // required this.loading,
  });
  // late final TextStyle loading;

  factory AppTextTheme.light(BuildContext context) {
    return const AppTextTheme();
  }
}

class TextThemeExtension extends ThemeExtension<TextThemeExtension> {
  TextThemeExtension(this.textTheme);
  late final AppTextTheme textTheme;
  @override
  TextThemeExtension lerp(TextThemeExtension? other, double t) {
    return TextThemeExtension(textTheme);
  }

  @override
  TextThemeExtension copyWith() {
    return TextThemeExtension(textTheme);
  }

  @override
  String toString() => 'TextThemeExtension';
}
