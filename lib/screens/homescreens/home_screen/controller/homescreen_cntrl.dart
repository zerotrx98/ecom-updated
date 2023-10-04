import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Categories/Api/categories_api_call.dart';
import '../../../Categories/Api/categories_model.dart';

class HomeScreenCntrl extends GetxController{
  var currentIndex = 0.obs;
  final RxInt cartCount = 0.obs;
  final RxList<Product> products = <Product>[].obs;
  final ApiService _apiService = ApiService();
  final categories = Categories().obs;
  RxInt quantity = 0.obs;

  Future<void> fetchCategories() async {
    try {
      categories.value = await _apiService.fetchCategories();
    } catch (e) {
      // Handle error
      print('Error fetching categories: $e');
    }
  }


  @override
  void onInit() {
    super.onInit();
    fetchCategories();

  }




}
class Product {
  final String image;
  final String name;
  final double price;
  final double discountPrice;
  final RxBool isProductClicked;
  final RxInt cartQuantity;

  Product({
    required this.image,
    required this.name,
    required this.price,
    required this.discountPrice,
    int? initialCartQuantity,
    bool? initialIsProductClicked,


  })  : isProductClicked = (initialIsProductClicked ?? false).obs,
        cartQuantity = (initialCartQuantity ?? 0).obs;
}
