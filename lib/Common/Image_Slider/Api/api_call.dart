import 'dart:convert';

import 'imageslider_model.dart';
import 'package:http/http.dart 'as http;
class BannerApi {


  Future<BannerImages> fetchBannerImages() async {
    final response = await http.get(Uri.parse('https://ecom.laurelss.com/Api/get_banner'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      print("API Response from banner_image: $jsonResponse"); // Print the API response for debugging
      return BannerImages.fromJson(jsonResponse);
    } else {
      print("API Error - Status Code: ${response.statusCode}");
      throw Exception('Failed to load banner images');
    }
  }
}