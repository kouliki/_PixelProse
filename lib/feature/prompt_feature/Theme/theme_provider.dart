// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_generator/feature/prompt_feature/Theme/light_mode.dart';

import 'dark_mode.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData =LightMode;
  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == DarkMode;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  void toggleTheme(){
    if(_themeData == LightMode)
      {
        themeData=DarkMode;
      }
    else{
      themeData=LightMode;
    }
  }


}