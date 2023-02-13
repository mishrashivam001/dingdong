import 'package:ding_dong/core/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/theme_data.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = AppTheme.lightTheme;

  ThemeData getTheme() => _themeData;

  void toggleTheme() {
    _themeData = _themeData == AppTheme.darkTheme
        ? AppTheme.lightTheme
        : AppTheme.darkTheme;
    notifyListeners();
  }
}
