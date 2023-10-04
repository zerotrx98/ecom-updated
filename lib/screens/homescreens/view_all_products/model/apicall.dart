import 'package:http/http.dart' as http;
import 'dart:convert';

class AllProductApi {
  static Future<Map<String, dynamic>> fetchAllProducts(int start, int perPage) async {
    final response = await http.get(Uri.parse('https://ecom.laurelss.com/Api/all_products?start=$start&per_page=$perPage'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
