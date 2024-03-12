// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app_af/model/quotedata.dart';
import 'package:quote_app_af/model/quotemodel.dart';

import '../helper/dbhelper.dart';

class FavController extends GetxController {
  RxList<QuoteData> favList = <QuoteData>[].obs;

  @override
  void onInit() {
    feaTchQuote();
    super.onInit();
  }

  Future<void> feaTchQuote() async {
    DBHelper helper = DBHelper();
    var data = await helper.getQuote();
    favList.value = data!.map((e) {
      return QuoteData.fromJson(e);
    }).toList();
    return;
  }

  void goBack() {
    Get.back();
  }


  Future deleteInfo(QuoteData quote) async {
    DBHelper helper = DBHelper();
    await helper.deleteQuote(quote);
    Get.showSnackbar(GetSnackBar(
      backgroundColor: Colors.red,
      title: "Quote",
      message: "Deleted Successfully",
      duration: Duration(seconds: 2),
    ));
  }
}
