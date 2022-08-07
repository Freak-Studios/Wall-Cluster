import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wall_cluster/constants/const.dart';

final ThemeData darkThemeData = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: defaultAccentColor,
      brightness: Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: darkForegroundColor,
      backgroundColor: darkAppBarThemeColor,
      elevation: 0,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    ),
    primaryColor: darkAppBarThemeColor,
    textTheme: const TextTheme());

final ThemeData lightThemeData = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: defaultAccentColor,
    brightness: Brightness.light,
  ),
  appBarTheme: AppBarTheme(
    foregroundColor: lightForegroundColor,
    backgroundColor: lightAppBarThemeColor,
    elevation: 0,
    systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  ),
  primaryColor: lightAppBarThemeColor,
);
