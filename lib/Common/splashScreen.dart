import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import 'bottomnav.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 7), () {
      Get.off(BottomNavigationWidget()); // Transition to HomeScreen
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/animations/animation_llltbno9.json',
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}