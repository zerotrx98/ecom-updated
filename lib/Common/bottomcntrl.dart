import 'package:cybzone_neoline/demotry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/Categories/view/categories.dart';
import '../screens/account_screen/view/account_screen.dart';
import '../screens/cart_screen/view/cart.dart';
import '../screens/homescreens/home_screen/view/homescreen.dart';
import '../screens/homescreens/homescreen_details/view/poduct_detals.dart';
import '../screens/orderdItem/view/ordereditem.dart';

class BottomNavigationController extends GetxController {
  final List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    OrderItem(),
    CartScreen(),
    AccountScreen(),
  ];

  final List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Image.asset(
        'assets/images/icons/home.png',
        width: 20,
        color: Colors.black,
      ),
      activeIcon: Image.asset(
        'assets/images/icons/home.png',
        width: 20,
        color: Colors.red,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Image.asset(
        'assets/images/icons/application.png',
        width: 20,
        color: Colors.black,
      ),
      activeIcon: Image.asset(
        'assets/images/icons/application.png',
        width: 20,
        color: Colors.red,
      ),
      label: 'Categories',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        'assets/images/icons/package.png',
        width: 20,
        color: Colors.black,
      ),
      activeIcon: Image.asset(
        'assets/images/icons/package.png',
        width: 20,
        color: Colors.red,
      ),
      label: 'Orders',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        'assets/images/icons/shopping-bag.png',
        width: 20,
        color: Colors.black,
      ),
      activeIcon: Image.asset(
        'assets/images/icons/shopping-bag.png',
        width: 20,
        color: Colors.red,
      ),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        'assets/images/icons/user.png',
        width: 20,
        color: Colors.black,
      ),

      activeIcon: Image.asset(
        'assets/images/icons/user.png',
        width: 20,
        color: Colors.red,
      ),
      label: 'Profile',
    ),
    // Add other items similarly
  ];

  final Color selectedColor = Colors.red;
  final Color unselectedColor = Colors.black;

  final RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}