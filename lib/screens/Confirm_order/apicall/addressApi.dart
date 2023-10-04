import 'dart:convert';
import 'package:http/http.dart' as http;

import 'orderconfirm_model.dart';

class AddressApi {

  Future<AddressControl> getAddressControl(customerId) async {
    final response = await http.get(Uri.parse('https://ecom.laurelss.com/Api/my_dashboard?customer_id=$customerId'));

    if (response.statusCode == 200) {
      return AddressControl.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch address control data');
    }
  }
}
