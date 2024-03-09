// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:get/get.dart';
import 'package:quote_app_af/view/home/homepage.dart';
import 'package:quote_app_af/view/home/splash.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Timer(Duration(seconds: 2), () {
      Get.offNamed("home");
      // Get.off(() => HomePage());

    });
  }
}
