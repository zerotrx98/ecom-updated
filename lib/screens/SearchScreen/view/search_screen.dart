import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Routes/routes.dart';
import '../controller/search_cntrl.dart';

class SearchScreen extends StatelessWidget {
  final SearchCntrl _searchController = Get.put(SearchCntrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Search',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0, // Remove app bar shadow
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController.searchController,
                autofocus: true,
                onChanged: (query) {
                  _searchController.search(query);
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            Expanded(
              child: Obx(() {
                if (_searchController.isLoading.value && _searchController.products.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (_searchController.products.isEmpty) {
                  return Center(
                    child: Text('No results found.'),
                  );
                } else {
                  return NotificationListener<ScrollNotification>(
                    onNotification: (scrollInfo) {
                      if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                        _searchController.loadMoreProducts(_searchController.searchController.text);
                      }
                      return true;
                    },
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: _searchController.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = _searchController.products[index];
                        return GestureDetector(
                          onTap: () {
                            // Handle the product tap
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white60,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.toNamed(
                                                Routes.productsDetails,
                                                arguments: product.productId.toString(),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.3),
                                                    spreadRadius: 1,
                                                    blurRadius: 5,
                                                    offset: Offset(0, 3),
                                                  ),
                                                ],
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                    product.productImage.toString(), // Assuming this holds the image URL
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        product.productName ?? '', // Display the product name
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      height: Get.height * 0.07,
                                      width: Get.width * 0.9,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5,
                                          horizontal: 10,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "\u20B9 ${product.sellingPrice ?? '0.00'}", // Display the selling price
                                              style: TextStyle(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.02,
                                            ),
                                            Text(
                                              "\u20B9 ${product.mrp ?? '0.00'}", // Display the MR price
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                decoration: TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // ... Other parts of your code for building the product
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
