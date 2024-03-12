import 'package:flutter/material.dart';

ThemeData light = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: const ColorScheme.light(background: Color(0xff007E66)),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500)),
    tabBarTheme: const TabBarTheme(
      indicatorColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.white,
      unselectedLabelStyle: TextStyle(color: Colors.white60),
    ),
    iconTheme: const IconThemeData(color: Colors.white));
