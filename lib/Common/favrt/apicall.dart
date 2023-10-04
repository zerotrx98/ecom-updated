import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WishlistController extends GetxController {
  RxBool isFavorite = false.obs;

  Future<void> toggleFavorite(String productId, String price, String offerPrice, String customerId) async {
    print('Toggling favorite status...');
    isFavorite.value = !isFavorite.value; // Toggle the favorite status

    if (isFavorite.value) {
      print('Adding to wishlist...');
      await addToWishlist(productId, price, offerPrice, customerId);
    } else {
      // Handle removal if needed
    }
  }

  Future<void> addToWishlist(String productId, String price, String offerPrice, String customerId) async {
    final apiUrl = 'https://ecom.laurelss.com/Api/add_to_wishlist';

    final Map<String, String> formData = {
      'product_id': productId,
      'price': price,
      'offer_price': offerPrice,
      'customer_id': customerId,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: formData,
      );

      if (response.statusCode == 200) {
        print('Item added to wishlist');
        // You can handle further actions here if needed
      } else {
        print('Failed to add item to wishlist. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error adding item to wishlist: $e');
    }
  }
}
