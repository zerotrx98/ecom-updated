import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../Common/loginAuth/login_controller/authecontle.dart';

class AddressController extends GetxController {
  AuthController authController = Get.put(AuthController());
  String customerId = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();
  var editname = "".obs;
  var editlastName = "".obs;
  var editphone = "".obs;
  var editaddress = "".obs;
  var editcity = "".obs;
  var editlandmark = "".obs;
  var editcountry = "".obs;
  var editpincode = "".obs;
  @override
  void onInit() {
    super.onInit();
    customerId = authController.customerId.value; // Get the customerId here
    // fetchProductDetails();
  }

  Future<void> saveAddress() async {
    const url =
        'https://ecom.laurelss.com/Api/add_address_guest'; // Replace with your actual API URL

    final response = await http.post(
      Uri.parse(url),
      body: {
        'name': nameController.text,
        'lastname': lastName.text,
        // You can add logic to extract last name from the name if needed
        'phone': mobileController.text,
        'customer_id': customerId,
        // Add logic for customer ID
        'customer_address': addressController.text,
        'customer_city': cityController.text,
        'customer_landmark': landMarkController.text,
        // Add logic for landmark if needed
        'country': stateController.text,
        'pincode': pinCodeController.text,
      },
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['status'] == 1 &&
          responseData['data'] == 'Address Added') {
        print('API call successful');
        print('Response: ${response.body}');
        // Show snackbar
        Get.snackbar('Success', 'Address added successfully',
            snackPosition: SnackPosition.BOTTOM);
        // Navigate back
      } else {
        print('API call failed: ${responseData['data']}');
      }
    } else {
      print('API call failed with status ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }

  Future<void> updateAddress(emailid

      ) async {
    const url =
        'https://ecom.laurelss.com/Api/update_address_checkout'; // Replace with your actual API URL

    final response = await http.post(
      Uri.parse(url),
      body: {
        'name': editname.value,
        'lastname': editlastName.value,
        'phone': editphone.value,
        'customer_id': customerId,
        'customer_address': editaddress.value,
        'customer_city': editcity.value,
        'customer_landmark': editlandmark.value,
        'country': editcountry.value,
        'pincode': editpincode.value,
        'edit_address_id':emailid,

      },
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
     print(responseData);
      Get.snackbar('Success', 'Address update successfully',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      print('API call failed with status ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }
}
