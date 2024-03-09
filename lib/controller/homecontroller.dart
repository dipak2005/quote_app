// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quote_app_af/model/quotemodel.dart';

class HomeController extends GetxController {
  bool isDark = false;
  RxList<Quote> quoteList = <Quote>[].obs;
  RxList<Quote> favList = <Quote>[].obs;
  String fileData = "";
  RxInt tIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    fileData = await rootBundle.loadString("lib/data/quote.json");

    quoteList.value = quoteFromJson(fileData ?? "");
    print("quoteList $quoteList");
  }

  void theme(bool value) {
    isDark = value;
  }

  void goto(Quote quote, int index) {
    Get.toNamed(
      "detail",
      arguments: [quote, index],
    );
  }

  void changeIndex(int index) {
    tIndex = index.obs;
  }

  void goFav() {
    Get.toNamed("fav");
  }

  void addFav(String quote) {
    favList.add(Quote(quote: quoteList.value));
    Get.showSnackbar(
      GetSnackBar(
        title: "Favorite",
        backgroundColor: Color(0xff42C02B),
        message: "Added Successfully",
        duration: Duration(seconds: 3),
      ),
    );
  }
}
