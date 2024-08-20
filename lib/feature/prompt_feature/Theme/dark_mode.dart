import 'package:flutter/material.dart';

const Color tdDarkBlue = Color(0xFF00072D);


ThemeData DarkMode= ThemeData(
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade600,
      secondary: Colors.grey.shade800,
      tertiary: Colors.grey.shade800,
      inversePrimary: Colors.grey.shade300,
    ),
      scaffoldBackgroundColor: tdDarkBlue
);