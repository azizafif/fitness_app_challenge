import 'package:fitness_exercises_challenge/app/design/app_colors.dart';
import 'package:fitness_exercises_challenge/app/design/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppThemes {
  AppThemes._();

  static ThemeMode themeMode = ThemeMode.light;

  //* Helpers
  static bool get isLight => themeMode == ThemeMode.light;
  static String get describingTitle => isLight ? 'Light' : 'Dark';
  static IconData get describingIcon => isLight ? CupertinoIcons.sun_haze : CupertinoIcons.moon_stars;

  static void toggleThemeMode() {
    themeMode = isLight ? ThemeMode.dark : ThemeMode.light;

    Get.changeThemeMode(themeMode);
  }

  //? LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    //? Colors
    brightness: Brightness.light,

    //? App Bar
    appBarTheme: const AppBarTheme(
      // backgroundColor: AppColors.appBarBackgroundColor,
      // foregroundColor: AppColors.appBarForegroundColor,
      elevation: AppValues.appBarButtonsElevation,
      toolbarHeight: AppValues.appBarHeight,
      shadowColor: AppColors.shadowColor,
      centerTitle: true,

      titleTextStyle: TextStyle(color: Colors.black),
    ),
    textTheme: const TextTheme(headline1: TextStyle(color: Colors.black)),
    //& Inputs
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      focusColor: Colors.white,
      contentPadding: const EdgeInsets.only(left: AppValues.inputLeftContentPadding),
      errorMaxLines: 3,
      prefixIconColor: AppColors.primaryColor,
      suffixIconColor: AppColors.primaryColor,
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.secondaryColor,
        ),
        borderRadius: BorderRadius.circular(
          AppValues.inputBorderRadius,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.secondaryColor,
        ),
        borderRadius: BorderRadius.circular(
          AppValues.inputBorderRadius,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.secondaryColor,
        ),
        borderRadius: BorderRadius.circular(
          AppValues.inputBorderRadius,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.errorColor,
        ),
        borderRadius: BorderRadius.circular(
          AppValues.inputBorderRadius,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.errorColor,
        ),
        borderRadius: BorderRadius.circular(
          AppValues.inputBorderRadius,
        ),
      ),
    ),
    //? Card
    cardTheme: const CardTheme(
      color: Colors.white,
      shadowColor: AppColors.shadowColor,
      elevation: AppValues.cardElevation,
      margin: EdgeInsets.symmetric(horizontal: AppValues.cardElevation),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppValues.cardRadius)),
      ),
    ),
    //? Text Button
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        overlayColor: MaterialStateProperty.all(AppColors.overlayColor),
        shadowColor: MaterialStateProperty.all(Colors.white),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppValues.textButtonRadius)))),
        // textStyle: MaterialStateProperty.all(AppStyles.textButtonTitleTextStyle),
      ),
    ),

    //? Progress Indicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      circularTrackColor: AppColors.warningColor,
      color: AppColors.primaryColor,
      linearTrackColor: AppColors.warningColor,
    ),

    //? Primary Icon
    primaryIconTheme: const IconThemeData(color: AppColors.primaryColor),

    //? Icon
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
  );
}
