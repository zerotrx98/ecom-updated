import 'package:cybzone_neoline/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Make sure to import GetX

import '../../Apicall/profile_modelclass.dart';
import '../../cntrl/profile_controller.dart';

class SavedAddress extends StatelessWidget {
  final ProfileController addressController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Saved Addresses',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(
            () {
          final allAddresses = addressController.profile.value.allAddress;

          if (allAddresses == null) {
            // Data is not available yet, show a circular progress indicator
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (allAddresses.isEmpty) {
            // Data is available but there are no saved addresses
            return Center(
              child: Text("No saved addresses."),
            );
          } else {
            // Data is available and there are saved addresses
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: allAddresses.length,
                    itemBuilder: (context, index) {
                      final address = allAddresses[index];
                      return AddressContainer(address: address);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.addressScreen);
                    },
                    child: Text("Add Address"),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class AddressContainer extends StatelessWidget {
  final Address address;

  AddressContainer({required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' ${address.name }',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5,),
          Text(
            ' ${address.phone}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),          SizedBox(height: 5,),

          Row(
            children: [
              Text(
                ' ${address.customerAddress}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                ' ${address.customerCity}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),          SizedBox(height: 5,),

          Text(
            ' ${address.customerPincode}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),          SizedBox(height: 5,),

          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.editAddress, arguments: address);
            },
            child: Container(
              height: Get.height * 0.04,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  "Edit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
