import 'dart:convert';
import 'package:http/http.dart' as http;

import 'modelclass.dart';

class OrderHistoryApi {
  static Future<OrderHistory> fetchOrderHistory(customerId) async {
    print('Fetching order history for customer: $customerId');

    final response = await http.get(Uri.parse('https://ecom.laurelss.com/Api/order_history?customer_id=4'));

    if (response.statusCode == 200) {
      print('Order history fetched successfully');
      final decodedData = json.decode(response.body);
      print('Decoded data: $decodedData');
      return OrderHistory.fromJson(decodedData);
    } else {
      print('Failed to fetch order history. Status code: ${response.statusCode}');
      throw Exception('Failed to fetch order history');
    }
  }
}
