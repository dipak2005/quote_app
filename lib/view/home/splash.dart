// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../controller/splashcontroller.dart';

class Splash extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/quote.png"),
          Hero(
            tag: "app",
            child: Text(
              "Quote App",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
            ),
          )
        ],
      ),
      drawer: Drawer(),
    );
  }
}
