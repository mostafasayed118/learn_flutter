import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.KPrimary,
        primary: AppColors.KPrimary,
      ),
      scaffoldBackgroundColor: AppColors.KBackground,
      useMaterial3: true,
    );
  }
}
