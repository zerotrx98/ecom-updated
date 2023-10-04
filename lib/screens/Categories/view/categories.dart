import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cntrl/cntrl.dart';

class CategoryScreen extends StatelessWidget {
  final CategoriesController categoryController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Categories",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(() {
        if (categoryController.categories.value == null) {
          return Center(child: CircularProgressIndicator());
        }

        final categories = categoryController.categories.value; // Access the value

        return ListView.builder(
          itemCount: categories.category?.length ?? 0,
          itemBuilder: (context, index) {
            final category = categories.category?[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: categoryItems(
                categoryName: category?.categoryName ?? '',
                categoryImage: NetworkImage(category?.categoryImage ?? ''),
              ),
            );
          },
        );
      }),
    );
  }

  Widget categoryItems({
    required String categoryName,
    required ImageProvider categoryImage,
  }) {
    return GestureDetector(
      onTap: () {
        // Handle category item click here
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 110, left: 5),
          child: Text(
            categoryName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        height: Get.height * 0.2,
        width: Get.width / 1.1,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
            ),
          ],
          image: DecorationImage(
            image: categoryImage,
            fit: BoxFit.fitWidth,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
