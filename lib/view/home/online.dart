// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app_af/controller/online_controller.dart';
import 'package:quote_app_af/helper/apihelper.dart';
import 'package:quote_app_af/model/quotes_api_model.dart';

import '../../controller/detailcontroller.dart';

class Online extends StatelessWidget {
  final OnlineController controller = Get.put(OnlineController());

  // final DetailController detailController = Get.find<DetailController>();

  Online({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => (controller.isShow.isTrue)
              ? SizedBox(
                  height: Get.height / 20,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search Text",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                )
              : Text(
                  "Quotes of the Day",
                ),
        ),
        actions: [
          Hero(
            tag: controller.isShow,
            child: IconButton(
              onPressed: () {
                controller.show();
              },
              icon: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: ApiHelper().getApiData(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                QuoteApi? quote = snapshot.data;
                return Expanded(
                  child: (snapshot.hasData)
                      ? ListView.builder(
                          itemCount: quote?.results?.length,
                          itemBuilder: (context, index) {
                            Result? data = quote?.results?[index];
                            return Stack(
                              children: [
                                Container(
                                  height: Get.height / 5,
                                  width: Get.width,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
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
                                          blurStyle: BlurStyle.outer,
                                          offset: Offset(0.9, 0.9),
                                          blurRadius: 10,
                                        )
                                      ],
                                      color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text("${data?.content}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18)),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: IconButton(
                                    onPressed: () {

                                    },
                                    icon: Icon(Icons.favorite_border),
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(color: Colors.red),
                        ),
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
