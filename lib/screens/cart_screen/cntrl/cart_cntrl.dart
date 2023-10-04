import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Common/loginAuth/login_controller/authecontle.dart';
import '../api/apicall.dart';
import '../api/modelclass.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  AuthController authController = Get.put(AuthController());
  String customerId = '';
  var count = 0.obs;
  var isLoading = true.obs;

  final TextEditingController couponcntrl = TextEditingController();
  Rx<MyCart> cartData = Rx<MyCart>(MyCart()); // Initialize with a default value

   RxMap itemQuantities = {}.obs;
   RxDouble totalCartPrice = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    customerId = authController.customerId.value; // Get the customerId here
    // fetchProductDetails();
    fetchCartData();

  }

  void calculateTotalCartPrice() {
    double totalPrice = 0.0;

    // Loop through cart items and calculate total price
    cartData.value.cart![0].details!.forEach((details) {
      final currentQuantity = itemQuantities[details.cartDetailsId] ?? 0;
      final itemPrice = double.parse(details.itemOfferPrice ?? '0.0');

      totalPrice += currentQuantity * itemPrice;
      print('currentQuantity: $currentQuantity');
      print('itemPrice: $itemPrice');
      print('totalPrice: $totalPrice');
    });

    // Update total cart price
    totalCartPrice.value = totalPrice;

  }



  var selectedPaymentMethod = 'Select Payment Method'.obs;
  List<String> paymentMethods = [
    'Select Payment Method',
    'Prepaid Order - Free Shipping',
    '&200 Additional Charge for Cash on Delivery',
  ];

  void increaseCount(
      String cartDetailsId, String productId, String price, String offerPrice) {
    final cartItem = cartData.value.cart?[0];

    if (cartItem != null) {
      final item = cartItem.details?.firstWhere(
        (detail) => detail.cartDetailsId == cartDetailsId,
      );

      if (item != null) {
        final currentQuantity = itemQuantities[cartDetailsId] ??
            int.tryParse(item.itemQuantity ?? '0') ??
            0;
        itemQuantities[cartDetailsId] = currentQuantity + 1;

        // Call addToCart API with the updated quantity
        addToCart(
          productId: productId.toString(),
          price: price.toString(),
          offerPrice: offerPrice.toString(),
          nos: (currentQuantity + 1).toString(), // Updated quantity
        );
        calculateTotalCartPrice();

      }
    }
  }

  void decreaseCount(
      String cartDetailsId, String productId, String price, String offerPrice) {
    final cartItem = cartData.value.cart?[0];

    if (cartItem != null) {
      final item = cartItem.details?.firstWhere(
        (detail) => detail.cartDetailsId == cartDetailsId,
      );

      if (item != null) {
        final currentQuantity = itemQuantities[cartDetailsId] ??
            int.tryParse(item.itemQuantity ?? '0') ??
            0;
        if (currentQuantity > 0) {
          itemQuantities[cartDetailsId] = currentQuantity - 1;

          addToCart(
            productId: productId.toString(),
            price: price.toString(),
            offerPrice: offerPrice.toString(),
            nos: (currentQuantity - 1).toString(), // Updated quantity
          );
          calculateTotalCartPrice(); // Call this to update the subtotal

        }
      }
    }
  }

  Future fetchCartData() async {
    try {
      isLoading(true);

      final fetchedCartData = await MyCartApiService().getCartData(customerId);
      cartData.value = fetchedCartData;

      // Initialize itemQuantities with the initial quantities from the fetched cart data
      itemQuantities.clear(); // Clear the map to ensure accurate data
      final cartItem = fetchedCartData.cart?[0];
      cartItem?.details?.forEach((detail) {
        itemQuantities[detail.cartDetailsId ?? ''] =
            int.tryParse(detail.itemQuantity ?? '0') ?? 0;
      });

      calculateTotalCartPrice();

    } catch (e) {
      print('Error fetching cart data: $e');
    }
  }

  void removeFromCartApi({required String productId}) async {
    try {
      await MyCartApiService().removeProductFromCart(customerId, productId);
      await fetchCartData();
      update();// Make sure to wait for the fetchCartData function to complete
    } catch (e) {
      print('Error removing from cart: $e');
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
