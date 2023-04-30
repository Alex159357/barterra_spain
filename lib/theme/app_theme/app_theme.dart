
import 'package:barterra2/theme/app_theme/themes/app_theme_dark.dart';
import 'package:barterra2/theme/app_theme/themes/app_theme_helloween.dart';
import 'package:barterra2/theme/app_theme/themes/app_theme_new_year.dart';
import 'package:flutter/material.dart';

import '../theme_controler.dart';
import 'themes/app_theme_light.dart';

class AppTheme{
  static ThemeData light = AppThemeLight().theme;
  static ThemeData dark = AppThemeDark().theme;


  ThemeData getCurrentTheme(CurrentTheme theme) {
    switch (theme) {
      case CurrentTheme.LIGHT:
        return light;
      case CurrentTheme.DARK:
        return dark;
      case CurrentTheme.HALLOWEEN:
        return AppThemeHalloween().theme;
      case CurrentTheme.NEW_YEAR:
        return AppThemeNewYear().theme;
      case CurrentTheme.VALENTINES_DAY:
        return AppThemeNewYear().theme;
      case CurrentTheme.MARCH8:
        return AppThemeNewYear().theme;
    }
  }
}