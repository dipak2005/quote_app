import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app_af/model/quotemodel.dart';

class DetailController extends GetxController {
  Map<String, dynamic> map = {};
  RxBool isShow = RxBool(false);
   Quote? quote;
  Quote? list1;
  int list2 = 0;

  @override
  void onInit() {
    argument();
    super.onInit();
  }

  void show() {
    isShow.value = !isShow.value;
    print(!isShow.value);
  }

  void argument() {
    var args = Get.arguments;
    if (args != null) {
      list1 = args[0];
      list2 = args[1];
      print(list2);
    }
  }

  void goDetail(String args) {
    Get.toNamed("wall", arguments: args);
  }
}
