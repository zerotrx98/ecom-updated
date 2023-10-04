
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../cntrl/address_cntrl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../cntrl/address_cntrl.dart';

class AddressScreen extends StatelessWidget {
  final AddressController controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Address Screen',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        children: [
          TextFormField(
            controller: controller.nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(
              ),
            ),
          ),
          TextFormField(
            controller: controller.lastName,
            decoration: InputDecoration(
              labelText: 'Last Name',
              labelStyle: TextStyle(
              ),
            ),
          ),
          TextFormField(
            controller: controller.mobileController,
            decoration: InputDecoration(
              labelText: 'Mobile Number',
              labelStyle: TextStyle(
              ),
            ),
          ),
          TextFormField(
            controller: controller.addressController,
            decoration: InputDecoration(
              labelText: 'Address',
              labelStyle: TextStyle(
              ),
            ),
          ),
          TextFormField(
            controller: controller.pinCodeController,
            decoration: InputDecoration(
              labelText: 'Pin Code',
              labelStyle: TextStyle(
              ),
            ),
          ),
          TextFormField(
            controller: controller.cityController,
            decoration: InputDecoration(
              labelText: 'City',
              labelStyle: TextStyle(
              ),
            ),
          ),
          TextFormField(
            controller: controller.landMarkController,
            decoration: InputDecoration(
              labelText: 'Land Mark',
              labelStyle: TextStyle(
              ),
            ),
          ),
          TextFormField(
            controller: controller.stateController,
            decoration: InputDecoration(
              labelText: 'Country',
              labelStyle: TextStyle(
              ),

            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              onPressed: () async {
                // Show loading indicator
                Get.dialog(
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                );

                // Simulate a delay (you can replace this with your actual save logic)
                await Future.delayed(Duration(seconds: 2));

                // Save address
                controller.saveAddress();

                // Close the loading indicator dialog
                Get.back();

                // Navigate back
                Get.back();
              },
              child: Text(
                'Save Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
