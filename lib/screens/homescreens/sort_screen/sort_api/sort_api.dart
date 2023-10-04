import 'package:cybzone_neoline/screens/homescreens/sort_screen/sort_api/sort_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SortApi {
  Future<SortScreen> getCategoryWiseProducts({
    required String type,
    required int start,
    required int rowPerPage,
    required int sort,
    required String search,
    required String cate,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://ecom.laurelss.com/Api/categorywise_products_ajax'),
        body: {
          'type': type,
          'start': start.toString(),
          'rowperpage': rowPerPage.toString(),
          'sort': sort.toString(),
          'search': search,
          'category':cate.toString()
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print('Response Datas: $jsonData');
        return SortScreen.fromJson(jsonData);
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to fetch data exception');
      }
    } catch (e) {
      print('An error occurred apii : $e');
      throw Exception('Failed to fetch data');
    }
  }
}
