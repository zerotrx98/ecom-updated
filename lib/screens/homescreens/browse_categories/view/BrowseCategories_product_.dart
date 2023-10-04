import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Routes/routes.dart';
import '../../../Categories/Api/categories_model.dart';
import '../../home_screen/controller/homescreen_cntrl.dart';



class BrowseCategories extends StatelessWidget {
  HomeScreenCntrl homeScreenCntrl = Get.put(HomeScreenCntrl());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          final categories = homeScreenCntrl.categories.value;
          if (categories.category == null || categories.category!.isEmpty) {
            return Container();
          }

          final categoryItems = categories.category;
          int totalItems = categoryItems!.length;

          // Calculate the number of items in each row
          int itemsInFirstRow = totalItems ~/ 2;
          int itemsInSecondRow = totalItems - itemsInFirstRow;

          List<Category> firstRowCategories =
          categoryItems.sublist(0, itemsInFirstRow);

          List<Category> secondRowCategories =
          categoryItems.sublist(itemsInFirstRow);

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: firstRowCategories.map((category) {
                  return BrowseCategoriesGridItem(category: category);
                }).toList(),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: secondRowCategories.map((category) {
                  return BrowseCategoriesGridItem(category: category);
                }).toList(),
              ),
            ],
          );
        }),
      ],
    );
  }
}

class BrowseCategoriesGridItem extends StatelessWidget {
  final Category? category;

  BrowseCategoriesGridItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the tap event, for example, navigate to a different page
        Get.toNamed(
          Routes.browse_categories_productView,
          arguments: category?.categoryId, // Pass the category name as an argument
        );
      },
      child: Container(
        width: Get.width * 0.14,
        child: Column(
          children: [
            Container(
              // Your image decoration and content here
              child: Container(
                width: double.infinity,
                height: Get.height * 0.055,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(category?.categoryImage ?? ''),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Text(
              category?.categoryName ?? 'N/A',
              style: TextStyle(fontSize: 10),
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Add this line to show ellipsis if text overflows
            ),

          ],
        ),
      ),
    );
  }
}
