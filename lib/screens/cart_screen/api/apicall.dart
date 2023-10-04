import 'dart:convert';
import 'package:http/http.dart' as http;

import 'modelclass.dart';

class MyCartApiService {

  Future<MyCart> getCartData(customerid) async {
    final response = await http.get(Uri.parse("https://ecom.laurelss.com/Api/my_carts?customer_id=$customerid"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
print(customerid);
      print("Response JSON Data: $jsonData"); // Print response JSON data

      final myCart = MyCart.fromJson(jsonData);

      print("Parsed MyCart Object: $myCart"); // Print parsed MyCart object

      return myCart;
    }

    else {
      print("API Request Failed: ${response.statusCode}");
      throw Exception('Failed to load cart data');
    }
  }

  Future<void> removeProductFromCart(
      String customerId, String productId) async {
    try {
      final response = await http.post(
        Uri.parse('https://ecom.laurelss.com/Api/remove_cart_product'),
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
