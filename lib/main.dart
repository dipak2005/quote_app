// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app_af/view/home/detailpage.dart';
import 'package:quote_app_af/view/home/favpage.dart';
import 'package:quote_app_af/view/home/homepage.dart';
import 'package:quote_app_af/view/home/online.dart';
import 'package:quote_app_af/view/home/splash.dart';
import 'package:quote_app_af/view/home/wall.dart';
import 'package:quote_app_af/view/theme/dark.dart';
import 'package:quote_app_af/view/theme/light.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Quote_App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: "/",
      routes: {
        "/": (p0) => Splash(),
        "home": (p0) => HomePage(),
        "detail": (p0) => DetailPage(),
        "wall": (p0) => Wall(),
        "fav": (p0) => FavPage(),
        "online": (p0) => Online(),
      },
    );
  }
}
