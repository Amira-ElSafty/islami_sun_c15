import 'package:flutter/material.dart';
import 'package:islami_sun_c15/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_sun_c15/utils/app_styles.dart';
class AppTheme {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparentColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.blackColor,
      ),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.blackBgColor,
          iconTheme: IconThemeData(
              color: AppColors.primaryColor
          )
      )
    // textTheme: TextTheme(
    //   headlineLarge:AppStyles.bold16White
    // )
  );
}
