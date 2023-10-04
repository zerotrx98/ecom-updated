import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Common/loginAuth/login_controller/authecontle.dart';

import 'package:http/http.dart' as http;

import '../../sort_screen/sort_api/sort_api.dart';
import '../../sort_screen/sort_api/sort_model.dart';
import '../../view_all_products/model/products_all_model.dart';
import '../api_call/apicall.dart';
import '../api_call/cate_product_model.dart';

// class CategoriesWise extends GetxController {
//
//   AuthController authController = Get.put(AuthController());
//   String customerId = ''; // Initialize customerId here
//   RxList<ProductWise> productWise = <ProductWise>[].obs;
//   RxBool isLoading = false.obs;
//   RxInt currentPage = 1.obs;
//   final int productsPerPage = 20;
//   final RxInt cartCount = 0.obs;
//   final RxList<ProductCount> productscount = <ProductCount>[].obs;
//   RxList<String?> favoriteProductIds = <String?>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     customerId = authController.customerId.value; // Get the customerId here
//
//     fetchProductsCate();
//   }
//
//
//   int categoryId = 0;
//
//   void setCategoryId(int id) {
//     categoryId = id;
//   }
//
//
//
//
//   Future<void> toggleFavorite(String productId, String price, String offerPrice,
//       ) async {
//     if (favoriteProductIds.contains(productId)) {
//       favoriteProductIds.remove(productId);
//     } else {
//       favoriteProductIds.add(productId);
//     }
//     update();
//     await addToWishlist(productId, price, offerPrice);
//   }
//
//   Future<void> addToWishlist(String productId, String price, String offerPrice,
//       ) async {
//     try {
//       final response = await http.post(
//         Uri.parse('https://ecom.laurelss.com/Api/add_to_wishlist'),
//         body: {
//           'product': productId,
//           'note':"",
//           'price': price,
//           'offer_price': offerPrice,
//           'customer_id': customerId,
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         final status = jsonResponse['status'] as int;
//
//         if (status == 1) {
//           final message = jsonResponse['data'];
//           print('Login: $message'.toString());
//         } else if (status == 2) {
//           final errorMessage = jsonResponse['data'];
//           print(errorMessage.toString());
//         } else {
//           print('Unknown status code: $status');
//         }
//       } else {
//         throw Exception('Failed to submit form');
//       }
//     } catch (error) {
//       print('Error submitting form: $error');
//     }
//   }
//
//   Future<void> fetchProductsCate() async {
//     isLoading.value = true;
//
//     try {
//       final Map<String, dynamic> data = await ProductCateApi.fetchCateProducts(
//         (currentPage.value - 1) * productsPerPage,
//         productsPerPage,receivedData
//       );
//       List<ProductWise> newProducts = Categorieswise.fromJson(data).productWise ?? [];
//
//       for (var newProduct in newProducts) {
//         productWise.add(newProduct);
//
//         if (newProduct.isWishlist == "1" && newProduct.productId != null) {
//           favoriteProductIds.add(newProduct.productId!);
//         }
//
//         int cartQuantity = 0;
//         productscount.add(ProductCount(
//           initialIsProductClicked: false,
//           initialCartQuantity: cartQuantity,
//         ));
//       }
//     } catch (e) {
//       print('Error: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   void incrementCartCount() {
//     cartCount.value++;
//   }
//
//   void decrementCartCount() {
//     if (cartCount.value > 0) {
//       cartCount.value--;
//     }
//   }
//
//   Icon getFavoriteIcon(int isWishlisted, String? productId) {
//     bool isProductInWishlist = isWishlisted == 1 && favoriteProductIds.contains(productId ?? '');
//
//     return Icon(
//       isProductInWishlist ? Icons.favorite : Icons.favorite_border,
//       size: 15,
//       color: isProductInWishlist ? Colors.red : null,
//     );
//   }
//
//   Future<void> addToCart(
//       {required String customerId,
//         required String productId,
//         required String price,
//         required String offerPrice,
//         required String nos,
//         String? note,
//         String? buyStatus}) async {
//     try {
//       final response = await http.post(
//         Uri.parse('https://ecom.laurelss.com/Api/add_to_cart'),
//         body: {
//           'customer_id': customerId,
//           'product': productId,
//           'price': price,
//           'offer_price': offerPrice,
//           'nos': nos,
//           'note': note ?? '',
//           'buystatus': buyStatus ?? '',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         final status = jsonResponse['status'] as int;
//
//         if (status == 1) {
//           final message = jsonResponse['data'];
//           print('Added to cart successfully: $message');
//         } else {
//           print('Unknown status code: $status');
//         }
//       } else {
//         throw Exception('Failed to add to cart');
//       }
//     } catch (error) {
//       print('Error adding to cart: $error');
//     }
//   }
//
//
//
//
//
// }
//
// class ProductCount {
//   final RxBool isProductClicked;
//   final RxInt cartQuantity;
//
//   ProductCount({
//     required int initialCartQuantity,
//     required bool initialIsProductClicked,
//   })  : isProductClicked = RxBool(initialIsProductClicked),
//         cartQuantity = RxInt(initialCartQuantity);
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../Common/loginAuth/login_controller/authecontle.dart';
import '../../../Categories/Api/categories_api_call.dart';
import '../../../Categories/Api/categories_model.dart';


class CategoriesWise extends GetxController {
  AuthController authController = Get.put(AuthController());
  String customerId = '';
  RxList<A> productsdata = <A>[].obs;
  RxBool isLoading = false.obs;
  RxInt currentPage = 1.obs;
  final int productsPerPage = 30;
  final RxInt cartCount = 0.obs;
  final RxList<ProductCount> productscount = <ProductCount>[].obs;
  RxList<String?> favoriteProductIds = <String?>[].obs;
  RxInt selectedSorting = 5.obs; // Default sorting option is 0
  final ApiService _apiService = ApiService();
  final categories = Categories().obs;
  RxList<bool> checkboxValues = <bool>[].obs;
// Use RxString instead of RxList<String>

  @override
  void onInit() {
    super.onInit();
    customerId = authController.customerId.value;
    fetchCategories();
    fetchProducts();
  }
  var receivedData = Get.arguments;

  Future<void> toggleFavorite(
      String productId, String price, String offerPrice) async {
    if (favoriteProductIds.contains(productId)) {
      favoriteProductIds.remove(productId);
      await removeProductFromWishlist(customerId, productId);
    } else {
      favoriteProductIds.add(productId);
      await addToWishlist(productId, price, offerPrice);
    }
    update();
  }

  Future<void> addToWishlist(
      String productId, String price, String offerPrice) async {
    try {
      final response = await http.post(
        Uri.parse('https://ecom.laurelss.com/Api/add_to_wishlist'),
        body: {
          'product': productId,
          'note': "",
          'price': price,
          'offer_price': offerPrice,
          'customer_id': customerId,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final status = jsonResponse['status'] as int;

        if (status == 1) {
          final message = jsonResponse['data'];
          print('Login: $message'.toString());
        } else if (status == 2) {
          final errorMessage = jsonResponse['data'];
          print(errorMessage.toString());
        } else {
          print('Unknown status code: $status');
        }
      } else {
        throw Exception('Failed to submit form');
      }
    } catch (error) {
      print('Error submitting form: $error');
    }
  }

  Future<void> removeProductFromWishlist(
      String customerId, String productId) async {
    try {
      final response = await http.post(
        Uri.parse('https://ecom.laurelss.com/Api/remove_wishlist_product'),
        body: {
          'customer_id': customerId,
          'id': productId,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final status = jsonResponse['status'] as int;

        if (status == 1) {
          final message = jsonResponse['data'];
          print('Removed from wishlist: $message');
        } else {
          print('Unknown status code: $status');
        }
      } else {
        throw Exception('Failed to remove from wishlist');
      }
    } catch (error) {
      print('Error removing from wishlist: $error');
    }
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;

    try {
      final SortScreen sortScreen = await SortApi().getCategoryWiseProducts(
        type: 'category',
        start: 0, // Always start at 0
        rowPerPage: 20 + (20 * (currentPage.value - 1)),
        sort: selectedSorting.value,
        search: '',
        cate: receivedData
      );

      List<A> newProducts = sortScreen.a ?? [];

      for (var newProduct in newProducts) {
        productsdata.add(newProduct);

        if (newProduct.isWishlist == '1' && newProduct.productId != null) {
          favoriteProductIds.add(newProduct.productId!);
        }

        int cartQuantity = 0;
        productscount.add(ProductCount(
          initialIsProductClicked: false,
          initialCartQuantity: cartQuantity,
        ));
      }

      // Increment the current page number
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchCategories() async {
    try {
      final categoriesResponse = await _apiService.fetchCategories();
      categories.value = categoriesResponse;

      // Initialize checkboxValues with false values for each category
      checkboxValues.value = List.generate(categoriesResponse.category!.length,
              (_) => false); // Access categoriesList
    } catch (e) {
      // Handle error
      print('Error fetching categories: $e');
    }
  }

  void toggleCheckbox(int index) {
    checkboxValues[index] = !checkboxValues[index];
    update();
  }

  void setSelectedSorting(int sorting) {
    selectedSorting.value = sorting;
    // Clear the productsdata list when sorting changes
    productsdata.clear();
    fetchProducts();
  }


  // If you need to clear the selected product ID, you can do it like this:

  void incrementCartCount() {
    cartCount.value++;
  }

  void decrementCartCount() {
    if (cartCount.value > 0) {
      cartCount.value--;
    }
  }

  Icon getFavoriteIcon(int isWishlisted, String? productId) {
    bool isProductInWishlist =
        isWishlisted == 1 && favoriteProductIds.contains(productId ?? '');

    return Icon(
      isProductInWishlist ? Icons.favorite : Icons.favorite_border,
      size: 15,
      color: isProductInWishlist ? Colors.red : null,
    );
  }

  Future<void> addToCart({
    required String customerId,
    required String productId,
    required String price,
    required String offerPrice,
    required String nos,
    String? note,
    String? buyStatus,
  }) async {
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

// ... (more methods if any)
}

class ProductCount {
  final RxBool isProductClicked;
  final RxInt cartQuantity;

  ProductCount({
    required int initialCartQuantity,
    required bool initialIsProductClicked,
  })  : isProductClicked = RxBool(initialIsProductClicked),
        cartQuantity = RxInt(initialCartQuantity);
}
