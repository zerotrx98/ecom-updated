import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'Common/loginAuth/loginbinding/loginbinding.dart';
import 'Routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.red,
      hintColor: Colors.redAccent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.red), // Change the back button color
      ),
      // Set other dark theme properties
    );

    final lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.red,
      hintColor: Colors.redAccent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.red), // Change the back button color
      ),
      // Set other light theme properties
    );

    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system, // Automatically switch between light and dark modes
      debugShowCheckedModeBanner: false,
      getPages: Routes.pages,
      initialRoute: Routes.splashscreen,
      initialBinding: AppBindings()

    );
  }
}
