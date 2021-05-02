import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  // ThemeData get theme => redTheme;
  @override
  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
            brightness: Brightness.light,
            color: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black87, size: 21)),
        inputDecorationTheme: InputDecorationTheme(
            focusColor: Colors.black12,
            labelStyle: TextStyle(),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            filled: true,
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
            // border: OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
            focusedBorder: OutlineInputBorder()),
        scaffoldBackgroundColor: Color(0xffF4F4F4),
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              colorScheme: ColorScheme.light(
                onError: Color(0xffFF2D55),
              ),
            ),
        tabBarTheme: tabBarTheme,
        canvasColor: Colors.transparent,
      );

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelPadding: insets.lowPaddingAll,
      labelColor: _appColorScheme.onSecondary,
      labelStyle: textThemeLight.headline5,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.2),
      // unselectedLabelStyle: textThemeLight.headline4.copyWith(color: colorSchemeLight.red),
    );
  }

  TextTheme textTheme() {
    return ThemeData.light().textTheme.copyWith(
        headline1:
            textThemeLight.headline1.copyWith(color: colorSchemeLight.black),
        headline2:
            textThemeLight.headline2.copyWith(color: colorSchemeLight.black),
        headline3:
            textThemeLight.headline3.copyWith(color: colorSchemeLight.black),
        headline4:
            textThemeLight.headline4.copyWith(color: colorSchemeLight.black),
        headline5:
            textThemeLight.headline5.copyWith(color: colorSchemeLight.black),
        headline6:
            textThemeLight.headline5.copyWith(color: colorSchemeLight.black),
        bodyText1: textThemeLight.body1.copyWith(color: colorSchemeLight.black),
        bodyText2: textThemeLight.body2.copyWith(color: colorSchemeLight.black),
        subtitle1:
            textThemeLight.subtitle1.copyWith(color: colorSchemeLight.black),
        subtitle2:
            textThemeLight.subtitle2.copyWith(color: colorSchemeLight.black),
        overline: textThemeLight.headline3);
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: colorSchemeLight.yellowLight,
        primaryVariant: colorSchemeLight.yellow,
        background: colorSchemeLight.greyLight300,
        onBackground: colorSchemeLight.black,
        secondary: colorSchemeLight.greyLight100,
        secondaryVariant: colorSchemeLight.grey,
        surface: colorSchemeLight.white,
        error: colorSchemeLight.red,
        onError: colorSchemeLight.redLight,
        onPrimary: colorSchemeLight.black,
        onSecondary: colorSchemeLight.grey,
        onSurface: colorSchemeLight.grey,
        brightness: Brightness.light);
  }
}
