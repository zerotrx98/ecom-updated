import 'dart:convert';

import 'package:cybzone_neoline/screens/homescreens/homescreen_details/view/api/relatedproduct_model_class.dart';

import '../api/modelclass.dart';
import 'package:http/http.dart'as http;
class ProductDetailsApi {

  Future<ProductDetails> fetchProductDetails(productID) async {
    final response = await http.get(Uri.parse("https://ecom.laurelss.com/Api/product_details?product_id=$productID"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return ProductDetails.fromJson(responseData);
    } else {
      throw Exception('Failed to load product details');
    }
  }

  Future<RelatedProducts> fetchRelatedProducts(productID) async {
    final response = await http.get(Uri.parse("https://ecom.laurelss.com/Api/related_product?product_id=$productID"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return RelatedProducts.fromJson(responseData);
    } else {
      throw Exception('Failed to load product details');
    }
  }


}
