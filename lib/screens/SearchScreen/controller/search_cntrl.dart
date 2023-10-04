import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api_search/api_search.dart';
import '../api_search/modelclass.dart';

class SearchCntrl extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxList<A> products = RxList<A>([]);
  final RxBool isLoading = RxBool(false);
  int currentPage = 1; // Track the current page for pagination
  int productsPerPage = 10; // Number of products to load per page

  // Method to perform search based on the entered query
  void search(String query) async {
    if (query.isEmpty) {
      products.clear();
      currentPage = 1; // Reset current page for new search
      return;
    }

    isLoading.value = true;

    try {
      final response = await SearchApi.searchProducts(
        type: 'category', // Replace with the appropriate type (string)
        start: 0,          // Make sure this is an int value
        rowPerPage: productsPerPage, // Use the defined productsPerPage value
        sort: 0,           // Make sure this is an int value
        search: query,
      );

      if (response != null) {
        currentPage = 1; // Reset current page for new search
        products.clear(); // Clear old search results
        products.assignAll(response.a ?? []);
      } else {
        products.clear();
      }
    } catch (e) {
      print('Error fetching search results: $e');
      products.clear();
    }

    isLoading.value = false;
  }

  // Method to load more products based on the current query and pagination
  Future<void> loadMoreProducts(String query) async {
    if (query.isEmpty) {
      return;
    }

    try {
      final response = await SearchApi.searchProducts(
        type: 'category', // Replace with the appropriate type (string)
        start: currentPage * productsPerPage, // Adjust based on your pagination logic
        rowPerPage: productsPerPage,           // Use the defined productsPerPage value
        sort: 0,                  // Make sure this is an int value
        search: query,
      );

      if (response != null) {
        products.addAll(response.a ?? []);
        currentPage++; // Increment the current page for the next load
      }
    } catch (e) {
      print('Error loading more products: $e');
    }
  }
}
