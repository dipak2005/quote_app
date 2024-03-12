// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app_af/controller/detailcontroller.dart';
import 'package:quote_app_af/controller/homecontroller.dart';
import 'package:quote_app_af/model/quotedata.dart';
import 'package:quote_app_af/model/util.dart';

import '../../model/quotemodel.dart';

class DetailPage extends StatelessWidget {
  final DetailController controller = Get.put(DetailController());
  final HomeController homeController = Get.find<HomeController>();

  DetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Hero(
            tag: "home",
            child: Icon(
              Icons.home,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        title: Text(
          "Quote",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30),
        ),
        centerTitle: true,
        actions: [
          Hero(
            tag: "fav",
            child: IconButton(
              onPressed: () {
                homeController.goFav();
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
            child: ListView.builder(
              itemCount: homeController.quoteList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var quote = homeController.quoteList[index];

                return SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height / 18,
                      width: MediaQuery.sizeOf(context).width / 8,
                      margin: EdgeInsets.all(10),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                          onTap: () {
                            controller.quote = quote;
                            controller.show();
                          },
                          child: Image.asset(quote.image ?? "",
                              fit: BoxFit.cover)),
                    ),
                    Text(quote.type ?? ""),
                  ]),
                );
              },
            ),
          ),
          Obx(
            () => Container(
              height: Get.height / 5,
              width: Get.width,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.9, 0.9),
                      blurStyle: BlurStyle.outer)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: Hero(
                tag: "index",
                child: Image.asset(
                    (controller.isShow.isTrue)
                        ? controller.quote?.image ?? ""
                        : controller.list1?.image ?? "",
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.list1?.quote?.length,
              itemBuilder: (context, index) {
                String quote = controller.list1?.quote?[index];

                if (quote.isNotEmpty) {
                  return Obx(
                    () => Container(
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
                          Hero(
                            tag: index,
                            child: Image.asset(
                                (controller.isShow.isTrue)
                                    ? controller.quote?.image ?? ""
                                    : controller.list1?.image ?? "",
                                fit: BoxFit.cover),
                          ),
                          Center(
                            child: Text(
                              (controller.isShow.isTrue)
                                  ? controller.quote?.quote![index] ?? ""
                                  : quote,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                controller.addInfo(QuoteData(
                                    type: controller.list1?.type,
                                    image: (controller.isShow.isTrue)
                                        ? controller.quote?.image ?? ""
                                        : controller.list1?.image ?? "",
                                    quote: (controller.isShow.isTrue)
                                        ? controller.quote?.quote![index] ?? ""
                                        : quote));
                              },
                              icon: Icon(Icons.favorite_border),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: IconButton(
                              onPressed: () {
                                // controller.deleteInfo();
                              },
                              icon: Icon(Icons.data_saver_on_rounded),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
