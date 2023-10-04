import 'dart:convert';
import 'package:http/http.dart' as http;

import 'modelclass.dart';

class WishlistApi {

  Future<MyWishlist> fetchWishlist(customerId) async {
    final response = await http.get(Uri.parse(      'https://ecom.laurelss.com/Api/my_wishlist?customer_id=$customerId'
    ));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final MyWishlist wishlist = MyWishlist.fromJson(jsonResponse);
      return wishlist;
    } else {
      throw Exception('Failed to load wishlist');
    }
  }

  Future<void> removeProductFromWishlist(
      String customerId, String productId) async {
    try {
      final response = await http.post(
        Uri.parse('https://ecom.laurelss.com/Api/remove_wishlist_product'),
        body: {
          'customer_id': customerId,
          'id': productId,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final status = jsonResponse['status']
            as int; // Assuming 'status' field in the response

        if (status == 1) {
          // Store customer ID and isLoggedIn status in SharedPreferences

          final message = jsonResponse[
              'data']; // Assuming 'error_message' field in the response
          print('Login : $message'.toString());

          // Print the customer ID
        } else if (status == 2) {
          final errorMessage = jsonResponse[
              'data']; // Assuming 'error_message' field in the response
          print('Login Error: $errorMessage'.toString());
        } else {
          print('Unknown status code: $status');
        }
      }
      else {
        throw Exception('Failed to submit form');
      }
    } catch (error) {
      print('Error submitting form: $error');
    }
  }
}
