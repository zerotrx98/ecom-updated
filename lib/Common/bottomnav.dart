import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'bottomcntrl.dart';


class BottomNavigationWidget extends StatelessWidget {
  final BottomNavigationController _controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _controller.screens[_controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        items: _controller.bottomNavigationBarItems,
        currentIndex: _controller.currentIndex.value,
        selectedItemColor: _controller.selectedColor,
        unselectedItemColor: _controller.unselectedColor,
        onTap: _controller.changeTab,
      )),
    );
  }
}