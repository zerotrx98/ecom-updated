import 'package:get/get.dart';
import '../Api/categories_api_call.dart';
import '../Api/categories_model.dart';

class CategoriesController extends GetxController {
  final ApiService _apiService = ApiService();
  final categories = Categories().obs;
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }
  Future<void> fetchCategories() async {
    try {
      categories.value = await _apiService.fetchCategories();
    } catch (e) {
      // Handle error
      print('Error fetching categories: $e');
    }
  }
}
