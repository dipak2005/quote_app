// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app_af/controller/homecontroller.dart';
import 'package:quote_app_af/model/quotemodel.dart';

class FavPage extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
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
      body: ListView.builder(
        itemCount: controller.favList.length,
        itemBuilder: (context, index) {
         Quote fav= controller.favList[index ];
          return  Container(
            height: Get.height / 6,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
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
               
                Image.asset(fav.image??""),
                Text("${fav.quote?[index]}")
              ],
            ),
          );
        },
      ),
    );
  }
}
