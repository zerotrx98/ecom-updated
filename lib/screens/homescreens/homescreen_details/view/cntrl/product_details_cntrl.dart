import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../../Common/loginAuth/login_controller/authecontle.dart';
import '../api/apicall.dart';
import '../api/modelclass.dart';
import 'package:http/http.dart' as http;

import '../api/relatedproduct_model_class.dart';

class ProductDetailsController extends GetxController {
  Rx<ProductDetails> productDetails =
      ProductDetails().obs; // Observable product details
  Rx<RelatedProducts> relatedProducts = RelatedProducts().obs;

  final isClicked = false.obs;
  final cartCount = 0.obs;
  AuthController authController = Get.put(AuthController());
  String customerId = '';

  @override
  void onInit() {
    super.onInit();
    customerId = authController.customerId.value; // Get the customerId here

    fetchProductDetails();
  }

  void showBottomSheet(BuildContext context, String productId) {
    TextEditingController nameController = TextEditingController();
    TextEditingController reviewController = TextEditingController();
    double starCount = 0;

    Get.bottomSheet(

      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                'Write A Review',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      starCount = rating; // Update the starCount
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                ),
                controller: nameController, // Use the TextEditingController
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Please write your review ',
                ),
                controller: reviewController, // Use the TextEditingController
              ),
              ElevatedButton(
                onPressed: () {
                  String enteredName = nameController.text;
                  String enteredReview = reviewController.text;

                  // Call the submitReviewAndRating method from the controller
                  submitReviewAndRating(
                    name: enteredName,
                    review: enteredReview,
                    rating: starCount,
                    productId: productId,
                  );

                  // Close the bottom sheet using GetX
                  Get.back();
                },
                child: Text(
                  "Submit Review",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Future<void> submitReviewAndRating({
    required String productId,
    required String name,
    required String review,
    required double rating,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://ecom.laurelss.com/Api/rating'),
        body: {
          'product_id': productId,
          'customer_id': customerId,
          'name': name,
          'review': review,
          'rating': rating.toString(),
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final status = jsonResponse['status'] as int;

        if (status == 200) {
          final message = jsonResponse['data'];
          print('Rating submitted successfully: $message');
        } else {
          print('Unknown status code: $status');
        }
      } else {
        throw Exception('Failed to submit rating');
      }
    } catch (error) {
      print('Error submitting rating: $error');
    }
  }

  void incrementCartCount({
    required String productId,
    required String price,
    required String offerPrice,
  }) {
    cartCount.value++;
    addToCartIfNeeded(
      productId: productId,
      price: price,
      offerPrice: offerPrice,
    );
  }

  void decrementCartCount({
    required String productId,
    required String price,
    required String offerPrice,
  }) {
    if (cartCount.value > 0) {
      cartCount.value--;
      addToCartIfNeeded(
        productId: productId,
        price: price,
        offerPrice: offerPrice,
      );
    }
  }

  void addToCartIfNeeded({
    required String productId,
    required String price,
    required String offerPrice,
  }) {
    if (cartCount.value > 0) {
      addToCart(
        productId: productId,
        price: price,
        offerPrice: offerPrice,
        nos: cartCount.value.toString(),
        note: null,
        // You can provide a note here if needed
        buyStatus: null, // You can provide a buy status here if needed
      );
    }
  }

  void toggleClickedState() {
    isClicked.value = cartCount.value > 0;
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
                border: OutlineInputBorder(),
              ),
              controller: countController,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                int enteredCount = int.tryParse(countController.text) ?? 0;
                if (enteredCount > 0) {
                  cartCount.value = enteredCount; // Update cart count
                  addToCartIfNeeded(
                    productId:
                        productDetails.value.details!.productId.toString(),
                    price: productDetails.value.details!.mrp.toString(),
                    offerPrice:
                        productDetails.value.details!.sellingPrice.toString(),
                  );
                  toggleClickedState();
                }
                Get.back(); // Close the bottom sheet using GetX
              },
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  var receivedData = Get.arguments;

  Future<void> fetchProductDetails() async {
    try {
      productDetails.value =
          await ProductDetailsApi().fetchProductDetails(receivedData);
      fetchProductRelated();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> fetchProductRelated() async {
    try {
      relatedProducts.value =
          await ProductDetailsApi().fetchRelatedProducts(receivedData);
    } catch (e) {
      // Handle error
    }
  }

  Future<void> addToCart(
      {required String productId,
      required String price,
      required String offerPrice,
      required String nos,
      String? note,
      String? buyStatus}) async {
    try {
      final response = await http.post(
        Uri.parse('https://ecom.laurelss.com/Api/add_to_cart'),
        body: {
          'customer_id': customerId,
          'product': productId,
          'price': price,
          'offer_price': offerPrice,
          'nos': nos,
          'note': note ?? '',
          'buystatus': buyStatus ?? '',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final status = jsonResponse['status'] as int;

        if (status == 1) {
          final message = jsonResponse['data'];
          print('Added to cart successfully: $message');
        } else {
          print('Unknown status code: $status');
        }
      } else {
        throw Exception('Failed to add to cart');
      }
    } catch (error) {
      print('Error adding to cart: $error');
    }
  }
}
