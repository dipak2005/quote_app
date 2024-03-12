// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app_af/controller/detailcontroller.dart';
import 'package:quote_app_af/controller/favcontroller.dart';
import 'package:quote_app_af/controller/homecontroller.dart';
import 'package:quote_app_af/model/quotedata.dart';
import 'package:quote_app_af/model/quotemodel.dart';

class FavPage extends StatelessWidget {
  final FavController controller = Get.put(FavController());

  FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              controller.goBack();
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.black,
            )),
        title: Text(
          "Favourite",
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.w700),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.feaTchQuote();
        },
        child: Obx(
          () => ListView.builder(
            itemCount: controller.favList.length,
            itemBuilder: (context, index) {
              QuoteData fav = controller.favList[index];

              print(fav.quote ?? "");
              return Container(
                height: Get.height / 6,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff69C076),
                      Color(0xff4AC04B),
                      Color(0xff33C00F),
                      Color(0xff38C04A),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0.9, 0.9),
                        blurStyle: BlurStyle.outer)
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    // Image.asset("${fav.image}",),
                    Center(
                      child: Text(
                        fav.quote ?? "",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Positioned(
                      height: Get.height / 20,
                      width: Get.width / 3.5,
                      top: 5,
                      left: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurStyle: BlurStyle.outer,
                                offset: Offset(0.9, 0.9),
                                blurRadius: 10),
                          ],
                        ),
                        child: Center(
                            child: Text(
                          fav.type ?? "",
                          style: TextStyle(color: Colors.black),
                        )),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                          onPressed: () {
                            controller.deleteInfo(fav);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
