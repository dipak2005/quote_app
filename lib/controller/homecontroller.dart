// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quote_app_af/model/quotemodel.dart';

class HomeController extends GetxController {
  bool isDark = false;
  RxList<Quote> quoteList = <Quote>[].obs;
  RxList<Quote> findList = <Quote>[].obs;
  String fileData = "";
  RxInt tIndex = 0.obs;
  RxBool isList = RxBool(true);

  @override
  void onInit() {
    super.onInit();
    getData();
    getSearch(fileData);
  }

  Future<void> getData() async {
    fileData = await rootBundle.loadString("lib/data/quote.json");

    quoteList.value = quoteFromJson(fileData ?? "");
    // print("quoteList $quoteList");
  }

  void theme(bool value) {
    isDark = value;
  }



  void changeIndex(int index) {
    tIndex.value = index;
  }

  void goto(Quote quote, int index) {
    Get.toNamed(
      "detail",
      arguments: [quote, index],
    );
  }

  void showList() {
    isList.value = false;
  }



  void goFav() {
    Get.toNamed("fav");
  }

  void getSearch(String searchKey) {
    RxList<Quote> result = <Quote>[].obs;
    if (searchKey.isEmpty) {
      result.value = quoteList;
    } else {
      result.value = quoteList
          .where(
              (p0) => p0.type!.toLowerCase().contains(searchKey.toLowerCase()))
          .toList();
    }

    findList.value = result;
  }

  void goOnline() {
    Get.toNamed("online");
  }
}
