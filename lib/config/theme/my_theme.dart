import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sss_app/data/shared_pref.dart';

import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';

class MyTheme {
  static getThemeData({required bool isLight}) {
    if (isLight) {
      return ThemeData(
        fontFamily: "SFUIDisplay",
        useMaterial3: true,
        primaryColor: LightThemeColors.primaryColor,
        primaryColorDark: LightThemeColors.primaryColorDarker,
        shadowColor: Colors.grey,
        // secondary & background color
        colorScheme: ColorScheme.fromSeed(
                seedColor: LightThemeColors.primaryColor,
                tertiary: LightThemeColors.accentColor,
                brightness: Brightness.light)
            .copyWith(
                secondary: LightThemeColors.secondary,
                primary: LightThemeColors.primaryColor),

        // color contrast (if the theme is dark text should be white for example)

        // card widget background color
        cardColor: Colors.grey,

        // hint text color
        hintColor: const Color.fromARGB(255, 95, 92, 92),
        // divider color
        primarySwatch: Colors.green,
        dividerColor: LightThemeColors.dividerColor,
        // canvas color
        focusColor: LightThemeColors.focusColor,
        canvasColor: LightThemeColors.canvasColor,

        // app background color
        scaffoldBackgroundColor: LightThemeColors.scaffoldBackgroundColor,
        // progress bar theme
        progressIndicatorTheme:
            ProgressIndicatorThemeData(color: LightThemeColors.primaryColor),
      );
    } else {
      return ThemeData(
        fontFamily: "SFUIDisplay",
        useMaterial3: true,
        primaryColor: LightThemeColors.primaryColor,
        primaryColorDark: LightThemeColors.primaryColorDarker,
        shadowColor: Colors.grey,
        // secondary & background color
        colorScheme: ColorScheme.fromSeed(
          seedColor: LightThemeColors.primaryColor,
          brightness: Brightness.dark,
          tertiary: LightThemeColors.accentColor,
        ).copyWith(
            secondary: LightThemeColors.secondary,
            onSurface: Colors.white,
            primary: LightThemeColors.primaryColor),

        // color contrast (if the theme is dark text should be white for example)

        // card widget background color
        cardColor: Colors.grey,

        // hint text color
        hintColor: const Color.fromARGB(255, 95, 92, 92),
        // divider color
        primarySwatch: Colors.green,
        dividerColor: LightThemeColors.dividerColor,
        // canvas color
        focusColor: LightThemeColors.focusColor,
        canvasColor: LightThemeColors.canvasColor,

        // app background color
        scaffoldBackgroundColor: DarkThemeColors.scaffoldBackgroundColor,
        // progress bar theme
        progressIndicatorTheme:
            ProgressIndicatorThemeData(color: LightThemeColors.primaryColor),
      );
    }
  }

  /// update app theme and save theme type to shared pref
  /// (so when the app is killed and up again theme will remain the same)
  static changeTheme() {
    // *) check if the current theme is light (default is light)
    bool isLightTheme = AppStorage.getThemeIsLight();

    // *) store the new theme mode on get storage
    AppStorage.setThemeIsLight(!isLightTheme);

    // *) let GetX change theme
    Get.changeThemeMode(!isLightTheme ? ThemeMode.light : ThemeMode.dark);
  }

  /// check if the theme is light or dark
  bool get getThemeIsLight => AppStorage.getThemeIsLight();
}

Color darkenColor(Color color, [double amount = 0.1]) {
  final hsl = HSLColor.fromColor(color);
  final darkerHsl = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
  return darkerHsl.toColor();
}

Color brigthenColor(Color color, [double amount = 0.1]) {
  final hsl = HSLColor.fromColor(color);
  final darkerHsl = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
  return darkerHsl.toColor();
}
