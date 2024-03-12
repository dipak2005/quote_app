// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quote_app_af/helper/dbhelper.dart';
import 'package:quote_app_af/model/quotedata.dart';
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
    // print(!isShow.value);
  }

  void argument() {
    var args = Get.arguments;
    if (args.isNotEmpty) {
      list1 = args[0];
      list2 = args[1];
      // print(list2);
    }
  }

  void goDetail(String args) {
    Get.toNamed("wall", arguments: args);
  }

  // void addFav({Quote? quote, String? ApiQuotes}) {
  //   favList.add(quote!);
  //   Get.showSnackbar(GetSnackBar(
  //     title: "Favourite",
  //     message: "Added successfully",
  //     duration: Duration(seconds: 2),
  //     backgroundColor: Colors.green,
  //     // forwardAnimationCurve: Curves.linear,
  //   ));
  // }

  void addInfo(QuoteData quote) async {
    DBHelper helper = DBHelper();

    await helper.insertQuote(quote);
    print(quote);
    Get.showSnackbar(
      GetSnackBar(
        title: "Download",
        message: "Added successfully",
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
        // forwardAnimationCurve: Curves.linear,
      ),
    );
  }

}
