import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  final RxList<BotomProduct> products = <BotomProduct>[].obs;
  @override
  void onInit() {
    super.onInit();
    // Initialize products (dummy data)
    products.addAll([
      BotomProduct(name: "Firstech Analog Women Watch Collection With Best Quality Strap Best Finishing Body & Case", price:  6999, discountPrice: 499, image: 'https://img.shpy.in/208075/1692243812876_SKU-4259_0.jpg?width=600',    initialIsProductClicked: false,
      ),
      BotomProduct(name: "Genuine Leather Premium Quality Wallet With Brand Name Box Packing", price: 150.0, discountPrice: 120.0, image: 'https://img.shpy.in/208075/1692243378179_SKU-4258_0.jpg?width=600',    initialIsProductClicked: false,
      ),
      BotomProduct(name: "The Very First Time Series 8 Ultra With 32gb Built In Memory, Dynamic 3d Curved Amoled Display And All Real Accurate Working Sensors", price: 200.0, discountPrice: 160.0, image: 'https://img.shpy.in/208075/1692205083725_SKU-4255_0.jpg?width=600',    initialIsProductClicked: false,
      ),
      BotomProduct(name: "Timeless Elegance On Her Wrist, A R0lex Watch Is A Reflection Of Her Grace And Sophistication", price: 250.0, discountPrice: 200.0, image: 'https://img.shpy.in/208075/1692198270984_SKU-4254_0.jpg?width=600',    initialIsProductClicked: false,
      ),
      BotomProduct(name: "F0ssil Drum Roller Watch Full Premium Collection", price: 300.0, discountPrice: 240.0, image: 'https://img.shpy.in/208075/1692174878834_SKU-4251_0.jpg?width=600',    initialIsProductClicked: false,
      ),
    ]);
  }

  final currentIndex = 0.obs;
  final cartCount = 0.obs;
  final isClicked = false.obs;

  void openBottomSheet() {
    Get.bottomSheet(
      _buildBottomSheet(),
    );
  }


  void showCountInputBottomSheet() {
    TextEditingController countController = TextEditingController();

    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Enter Count"),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
              controller: countController,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                int enteredCount = int.tryParse(countController.text) ?? 0;
                cartCount(enteredCount);
                toggleClickedState();
                Get.back(); // Close the bottom sheet using GetX
              },
              child: Text("Save",style: TextStyle(
                color: Colors.white,fontWeight: FontWeight.bold
              ),),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white
    );
  }
  void setCartCount(int newCount) {
    cartCount.value = newCount;
  }



  void incrementCartCount() {
    cartCount.value++;
  }

  void decrementCartCount() {
    if (cartCount.value > 0) {
      cartCount.value--;
    }
  }

  void toggleClickedState() {
    isClicked.value = cartCount.value > 0;
  }

  Widget _buildBottomSheet() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: products.length,
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemBuilder: (context, index) {
                final product = products[index];
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(product.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${product.name}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      "\u20B9 ${product.discountPrice.toString()}",
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
                                      "\u20B9 ${product.price.toString()}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Obx(() {
                            if (!product.isProductClicked.value) {
                              return InkWell(
                                onTap: () {
                                  incrementProductCartCount(product);
                                  toggleProductClickedState(product);
                                },
                                child: Container(
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
                              );
                            } else {
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      decrementProductCartCount(product);
                                      toggleProductClickedState(product);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 4),
                                      child: Center(
                                        child: Text(
                                          "-",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                                    child: Text(
                                      '${product.cartQuantity.value}',
                                      style: TextStyle(fontSize: 12, color: Colors.red),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      incrementProductCartCount(product);
                                      toggleProductClickedState(product);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 4),
                                      child: Center(
                                        child: Text(
                                          "+",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                          }),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void incrementProductCartCount(BotomProduct product) {
    product.cartQuantity.value++;
    incrementCartCount();
  }

  void decrementProductCartCount(BotomProduct product) {
    if (product.cartQuantity.value > 0) {
      product.cartQuantity.value--;
      decrementCartCount();
    }
  }

  void toggleProductClickedState(BotomProduct product) {
    product.isProductClicked.value = product.cartQuantity.value > 0;
  }
}

class FilterOption {
  String title;
  bool isSelected;

  FilterOption(this.title, this.isSelected);
}

class BotomProduct {
  final String image;
  final String name;
  final double price;
  final double discountPrice;
  final RxBool isProductClicked;
  final RxInt cartQuantity;

  BotomProduct({
    required this.image,
    required this.name,
    required this.price,
    required this.discountPrice,
    int? initialCartQuantity,
    bool? initialIsProductClicked,
  })  : isProductClicked = (initialIsProductClicked ?? false).obs,
        cartQuantity = (initialCartQuantity ?? 0).obs;
}
