import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../Common/loginAuth/login_controller/authecontle.dart';
import '../Apicall/profile_apicall.dart';
import '../Apicall/profile_modelclass.dart';
import 'package:http/http.dart'as http;
class ProfileController extends GetxController {
  AuthController authController = Get.put(AuthController());
  String customerId = '';
  final profile = Profile().obs;
  final name = ''.obs;
  final last_name = ''.obs;
  final email = ''.obs;
  final phone = ''.obs;
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    customerId = authController.customerId.value;
    print('onInit: Customer ID - $customerId');
    fetchProfile();

    // Initialize name, email, phone, and oldPassword when profile data is fetched
    ever(profile, (_) {
      if (profile.value.customer != null) {
        name.value = profile.value.customer!.customerName ?? '';
        email.value = profile.value.customer!.customerEmail ?? '';
        phone.value = profile.value.customer!.customerPhone ?? '';
        last_name.value = profile.value.customer!.lastName ?? '';
      }
      update();
    });
  }

  Future<void> updateProfile() async {
    // Define the API endpoint URL
    final Uri apiUrl = Uri.parse("https://ecom.laurelss.com/Api/update_profile");

    // Prepare the request body data
    final Map<String, String> data = {
      'name': name.value,
      'lastname': last_name.value,
      'phone': phone.value,
      'customer_id': customerId,
      'email': email.value,
      'current_password': oldPasswordController.text,
      'password': newPasswordController.text,
    };

    try {
      final response = await http.post(apiUrl, body: data);

      final responseData = json.decode(response.body);
      final errorMsg = responseData['msg'];




      Get.snackbar(
        'Message',
        errorMsg,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 5),
      );

      if (response.statusCode == 200) {
        print('Response data: $responseData');
      } else {
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }


  Future<void> fetchProfile() async {
    try {
      print('fetchProfile: Fetching profile for Customer ID - $customerId');
      final fetchedProfile = await ProfileApi().getProfile(customerId);
      profile.value = fetchedProfile;
      print('fetchProfile: Profile fetched successfully');
    } catch (e) {
      print('fetchProfile: Error fetching profile - $e');
    }
  }
}
