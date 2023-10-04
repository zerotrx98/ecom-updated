import 'dart:convert';
import 'package:http/http.dart' as http;

import 'categories_model.dart';

class ApiService {
  static const String url = 'https://ecom.laurelss.com/Api/get_category'; // Replace with your API base URL

  Future<Categories> fetchCategories() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Response body categories: ${response.body}');
      return Categories.fromJson(jsonDecode(response.body));
    } else {
      print('Failed to load categories. Status code: ${response.statusCode}');
      throw Exception('Failed to load categories');
    }
  }
}
