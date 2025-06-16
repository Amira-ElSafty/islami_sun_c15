import 'package:flutter/material.dart';
import 'package:islami_sun_c15/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparentColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.blackColor,
      ));
}
