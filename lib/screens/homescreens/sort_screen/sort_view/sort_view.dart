import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/Bottomsheetcntrl.dart';
import '../../../../Common/bottomsheetLogin.dart';
import '../../../../Common/colors.dart';
import '../../../../Common/loginAuth/login_controller/authecontle.dart';
import '../../../../Routes/routes.dart';
import '../sort_cntrl/sort_cntrl.dart';

class SortSCreen extends StatelessWidget {
  final SortController productController = Get.put(SortController());
  final bottomSheetController = Get.put(BottomSheetController());

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        productController.currentPage.value++;
        productController.fetchProducts();
      }
    });
    AuthController authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('All Products'),
      ),
      body: Obx(
            () {
          if (productController.isLoading.value &&
              productController.currentPage.value == 1) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      "All Products",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: .60,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      productController.productsdata.length,
                          (index) {
                        final countdata =
                        productController.productscount[index];
                        final product = productController.productsdata[index];
                        return GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
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
                                                  arguments: product.productId.toString());
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                    spreadRadius: 1,
                                                    blurRadius: 5,
                                                    offset: Offset(0, 3),
                                                  ),
                                                ],
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                    product.productImage
                                                        .toString(), // Assuming productImage is a list of image URLs
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          right: 10,
                                          child: InkWell(
                                            onTap: () async {
                                              {
                                                if (authController
                                                    .isLoggedIn.value) {
                                                  // Add the async keyword here

                                                  await productController
                                                      .toggleFavorite(
                                                    product.productId
                                                        .toString(),
                                                    product.mrp.toString(),
                                                    product.sellingPrice
                                                        .toString(),
                                                  ); // Navigate to the wishlist screen
                                                } else {
                                                  LoginBottomSheetManager
                                                      .showLoginBottomSheet(
                                                      authController,
                                                      context); // Show the login bottom sheet
                                                }
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                BorderRadius.circular(30),
                                              ),
                                              child: Obx(() {
                                                bool isFavorited =
                                                productController
                                                    .favoriteProductIds
                                                    .contains(
                                                  product.productId.toString(),
                                                );
                                                return Icon(
                                                  isFavorited
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  size: 15,
                                                  color: isFavorited
                                                      ? Colors.red
                                                      : null,
                                                );
                                              }),
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
                                        product.productName ?? 'No Name',
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
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "\u20B9 ${product.sellingPrice ?? 'N/A'}",
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
                                              "\u20B9 ${product.mrp ?? 'N/A'}",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                decoration:
                                                TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: GestureDetector(
                                              onTap: () {
                                                bottomSheetController
                                                    .openBottomSheet();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                ),
                                                width: double.infinity,
                                                child: Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        "Colors",
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                        ),
                                                      ),
                                                      Icon(Icons
                                                          .arrow_drop_down_sharp),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: Get.height * 0.01),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.red,
                                                  width: 1.0,
                                                ),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              width: double.infinity,
                                              child: GestureDetector(
                                                onTap: () async {
                                                  if (authController.isLoggedIn.value) {
                                                    String customerId = authController.customerId.value;

                                                    int cartCount = countdata.cartQuantity.value; // Current cart count

                                                    // If the product hasn't been added to the cart, set the count to 1
                                                    if (!countdata.isProductClicked.value) {
                                                      cartCount = 1;
                                                    }

                                                    // Make the API call to add to cart
                                                    await productController.addToCart(
                                                      customerId: customerId,
                                                      productId: product.productId.toString(),
                                                      price: product.mrp.toString(),
                                                      offerPrice: product.sellingPrice.toString(),
                                                      nos: cartCount.toString(),
                                                    );

                                                    // Update the local counter and UI
                                                    productController.incrementCartCount();
                                                    countdata.cartQuantity.value = cartCount;
                                                    countdata.isProductClicked.value = true;
                                                  } else {
                                                    // Show the login bottom sheet
                                                    LoginBottomSheetManager.showLoginBottomSheet(authController, context);
                                                  }
                                                },
                                                child: Obx(
                                                      () => Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      if (!countdata.isProductClicked.value)
                                                        Container(
                                                          padding: EdgeInsets.symmetric(vertical: 4),
                                                          child: Center(
                                                            child: Text(
                                                              "+ Add",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.red,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (countdata
                                                          .isProductClicked
                                                          .value)
                                                        InkWell(
                                                          onTap: () async {
                                                            productController
                                                                .decrementCartCount();
                                                            countdata
                                                                .cartQuantity
                                                                .value--;
                                                            countdata
                                                                .isProductClicked
                                                                .value = countdata
                                                                .cartQuantity
                                                                .value >
                                                                0;
                                                            String customerId =
                                                                authController
                                                                    .customerId
                                                                    .value;

                                                            await productController
                                                                .addToCart(
                                                              customerId:
                                                              customerId,
                                                              productId: product
                                                                  .productId
                                                                  .toString(),
                                                              price: product.mrp
                                                                  .toString(),
                                                              offerPrice: product
                                                                  .sellingPrice
                                                                  .toString(),
                                                              nos: countdata
                                                                  .cartQuantity
                                                                  .value
                                                                  .toString(),
                                                            );
                                                            // Call the addToCart function with the updated count
                                                          },
                                                          child: Container(
                                                            child: Center(
                                                              child: Text(
                                                                "-",
                                                                style:
                                                                TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (countdata
                                                          .isProductClicked
                                                          .value)
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                              horizontal: 6,
                                                              vertical: 1),
                                                          child: Text(
                                                            '${countdata.cartQuantity.value}',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color:
                                                                Colors.red),
                                                          ),
                                                        ),
                                                      if (countdata
                                                          .isProductClicked
                                                          .value)
                                                        InkWell(
                                                          onTap: () async {
                                                            productController
                                                                .incrementCartCount();
                                                            countdata
                                                                .cartQuantity
                                                                .value++;
                                                            countdata
                                                                .isProductClicked
                                                                .value = true;
                                                            String customerId =
                                                                authController
                                                                    .customerId
                                                                    .value;

                                                            await productController
                                                                .addToCart(
                                                              customerId:
                                                              customerId,
                                                              productId: product
                                                                  .productId
                                                                  .toString(),
                                                              price: product.mrp
                                                                  .toString(),
                                                              offerPrice: product
                                                                  .sellingPrice
                                                                  .toString(),
                                                              nos: countdata
                                                                  .cartQuantity
                                                                  .value
                                                                  .toString(),
                                                            );
                                                          },
                                                          child: Container(
                                                            child: Center(
                                                              child: Text(
                                                                "+",
                                                                style:
                                                                TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
                  ),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false, // Hide selected label
        showUnselectedLabels: false, // Hide unselected label
        items: [



          BottomNavigationBarItem(

            icon: GestureDetector(

              onTap: () {
                Get.bottomSheet(BottomSheetContent());

              },
              child: Container(
                width: Get.width * 0.45,
                height: Get.height * 0.04,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "FILTER",
                    style: TextStyle(color: sclr, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            label: '',
          ),



          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                  ),
                  builder: (BuildContext context) {


                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "SORT BY",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black54,
                          ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              productController.setSelectedSorting(5); // Price: High to Low
                              Get.back();
                            },
                            child: Container(
                              color: Colors.grey[200],
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              child: Text(
                                'Price: High to Low',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              productController.setSelectedSorting(4); // Price: High to Low
                              Get.back();
                            },
                            child: Container(
                              color: Colors.grey[200],
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              child: Text(
                                'Price: Low to High',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),  SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              productController.setSelectedSorting(3); // Price: High to Low
                              Get.back();
                            },
                            child: Container(
                              color: Colors.grey[200],
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              child: Text(
                                'Product DESC',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),  SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              productController.setSelectedSorting(2); // Price: High to Low
                              Get.back();
                            },
                            child: Container(
                              color: Colors.grey[200],
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              child: Text(
                                'Product ASC',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          // Repeat similar code for other items
                        ],
                      ),
                    );
                  },
                );


              },
              child: Container(  // Add this child property
                width: Get.width * 0.45,
                height: Get.height * 0.04,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "SORT",
                    style: TextStyle(color: sclr, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            label: 'Buy Now',
          ),
        ],
      ),
    );
  }
}

class BottomSheetContent extends GetWidget<SortController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Set the background color to white
      child: Column(
        children: [
          Expanded(
            child: Obx(() {
              final categories = controller.categories.value.category;
              final checkboxValues = controller.checkboxValues;

              if (categories == null) {
                return CircularProgressIndicator();
              }

              return ListView(
                children: List.generate(categories.length, (index) {
                  return Row(
                    children: [
                      Checkbox(
                        value: checkboxValues[index],
                        onChanged: (value) {
                          controller.toggleCheckbox(index);
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          // Call your existing UI functionality with the productId
                        },
                        child: Text(categories[index].categoryName.toString()),
                      ),
                    ],
                  );
                }),
              );
            }),
          ),
          ElevatedButton(
            onPressed: () {
              controller.handleProductSelection(); // Call the method to populate selectedProductIds
              Get.back(); // Close the bottom sheet
            },
            child: Text('Apply'),
          ),

          SizedBox(height: 10), // Add spacing between the buttons
          TextButton(
            onPressed: () {
              // Implement the cancel button logic here
              Get.back(); // Close the bottom sheet
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
