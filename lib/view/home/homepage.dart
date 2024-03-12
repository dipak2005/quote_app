// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:quote_app_af/controller/detailcontroller.dart';
import 'package:quote_app_af/controller/homecontroller.dart';
import 'package:quote_app_af/model/quotemodel.dart';
import 'package:quote_app_af/model/util.dart';
import 'package:quote_app_af/view/home/detailpage.dart';
import 'package:quote_app_af/view/home/drawer.dart';
import 'package:quote_app_af/view/theme/dark.dart';
import 'package:quote_app_af/view/theme/light.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              controller.goOnline();
            },
            icon: Icon(
              Icons.web_stories,
              color: Colors.red,
              size: 30,
            )),
        title: Hero(
          tag: "app",
          child: Text(
            "Quotes",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (Get.isDarkMode) {
                Get.changeTheme(ThemeData.dark(useMaterial3: true));
                print("ThemeMode.dark");
              }
              {
                Get.changeTheme(ThemeData.light(useMaterial3: true));
              }
            },
            icon: Icon(
              (Get.isDarkMode) ? Icons.dark_mode_outlined : Icons.light,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              onChanged: (value) {
                controller.getSearch(value);
                controller.showList();
              },
              decoration: InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12)),
                prefixIcon: Hero(
                  tag: "search",
                  child: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.86, 0),
            child: Text(
              "Categories",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.findList.length,
                itemBuilder: (context, index) {
                  Quote quote = controller.findList[index];

                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.tIndex.value = index;
                          controller.goto(quote, controller.tIndex.value);
                        },
                        child: Container(
                          height: Get.height / 8,
                          width: Get.width,
                          margin: EdgeInsets.all(10),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 12,
                                  offset: Offset(0.9, 0.9)),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:
                              Image.asset(quote.image ?? "", fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        height: Get.height / 20,
                        width: Get.width / 3.5,
                        top: 20,
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
                            quote.type ?? "",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      // drawer: DrawerApp(),
    );
  }
}
