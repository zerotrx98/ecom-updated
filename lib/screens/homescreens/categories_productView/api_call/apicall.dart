import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductCateApi {
  static Future<Map<String, dynamic>> fetchCateProducts(int start, int perPage, String categories) async {
    print('Fetching products with start: $start, perPage: $perPage, categories: $categories');

    final response = await http.get(Uri.parse('https://ecom.laurelss.com/Api/categorywise_products?start=$start&per_page=$perPage&category=$categories'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print('Data received: $data');
      return data;
    } else {
      print('Failed to load products. Status code: ${response.statusCode}');
      throw Exception('Failed to load products');
    }
  }
}
