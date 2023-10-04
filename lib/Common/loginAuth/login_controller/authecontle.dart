import 'dart:convert';

import 'package:cybzone_neoline/Routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  RxBool isLoggedIn = false.obs;
  RxString customerId = RxString('');

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late SharedPreferences _prefs;

  @override
  void onInit() {
    super.onInit();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      isLoggedIn.value = _prefs.getBool('isLoggedIn') ?? false;
      customerId.value = _prefs.getString('customerId') ?? '';
    } catch (error) {
      print('Error initializing SharedPreferences: $error');
    }
  }




  void logout() {
    try {
      isLoggedIn.value = false;
      _prefs.setBool('isLoggedIn', false);
      customerId.value = ''; // Clear the customer ID when logging out
      _prefs.remove('customerId');
      update();
    } catch (error) {
      print('Error saving logout status: $error');
    }
  }

  Future<void> submitFormToBackend() async {
    String field1Value = email.text;
    String field2Value = password.text;

    try {
      final response = await http.post(
        Uri.parse('https://ecom.laurelss.com/Api/login_customer_with_password'),
        body: {
          'user': field1Value,
          'password': field2Value,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final status = jsonResponse['status']
            as int; // Assuming 'status' field in the response

        if (status == 1) {
          final customerIdValue = jsonResponse['customer_id'];

          // Update customer ID
          customerId.value = customerIdValue;

          // Update isLoggedIn status
          isLoggedIn.value = true;

          // Store customer ID and isLoggedIn status in SharedPreferences
          await _prefs.setString('customerId', customerIdValue);
          await _prefs.setBool('isLoggedIn', true);
          final message = jsonResponse[
              'data']; // Assuming 'error_message' field in the response
          print('Login : $message'.toString());
          Get.snackbar(
            'Message',
            message,
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 3),
          );
          // Print the customer ID
          print('Customer ID: $customerIdValue');
        } else if (status == 2) {
          final errorMessage = jsonResponse[
              'data']; // Assuming 'error_message' field in the response
          print('Login Error: $errorMessage'.toString());

          Get.snackbar(
            'Sign up Error',
            errorMessage,
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 3),
          );
        } else {
          print('Unknown status code: $status');
        }
      } else {
        throw Exception('Failed to submit form');
      }
    } catch (error) {
      print('Error submitting form: $error');
    }
  }

  Future<void> signup() async {
    String nameValue = nameController.text;
    String lastNameValue = lastNameController.text;
    String phoneValue = phoneController.text;
    String emailValue = emailController.text;
    String passwordValue = passwordController.text;

    try {
      final response = await http.post(
        Uri.parse(
            'https://ecom.laurelss.com/Api/register_customer_with_password'),
        body: {
          'name': nameValue,
          'lastname': lastNameValue,
          'phone': phoneValue,
          'email': emailValue,
          'password': passwordValue,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final status = jsonResponse['status']
            as int; // Assuming 'status' field in the response

        if (status == 1) {
          email.text = emailValue;
          password.text = passwordValue;
          final message = jsonResponse[
              'data']; // Assuming 'error_message' field in the response
          print('Login : $message'.toString());
          Get.snackbar(
            'Message',
            message,
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 3),
          );
        } else if (status == 2) {
          final errorMessage = jsonResponse[
              'data']; // Assuming 'error_message' field in the response
          print('Login Error: $errorMessage'.toString());

          Get.snackbar(
            'Sign up Error',
            errorMessage,
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 3),
          );
        } else {
          print('Unknown status code: $status');
        }
      } else {
        throw Exception('Failed to submit form');
      }
    } catch (error) {
      print('Error submitting form: $error');
    }
  }
}
