import 'dart:convert';
import 'package:http/http.dart' as http;

import 'modelclass.dart';

class SearchApi {
  static const String baseUrl = 'https://ecom.laurelss.com/Api/categorywise_products_ajax';

  static Future<SearchData> searchProducts({
    required String type,
    required int start,
    required int rowPerPage,
    required int sort,
    required String search,
  }) async {
    final url = Uri.parse(baseUrl);
    final response = await http.post(
      url,
      body: {
        'type': type,
        'start': start.toString(),
        'rowperpage': rowPerPage.toString(),
        'sort': sort.toString(),
        'search': search,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      print("search data    ${responseData}");
      return SearchData.fromJson(responseData);


    } else {
      throw Exception('Failed to load data');
    }
  }
}