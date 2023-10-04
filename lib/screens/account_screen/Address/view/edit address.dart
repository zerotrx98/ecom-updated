import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Apicall/profile_modelclass.dart';
import '../cntrl/address_cntrl.dart';

class AddressEditScreen extends StatelessWidget {
  final AddressController controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    // Retrieve the passed address data if available
    final Address? address = Get.arguments as Address?;

    // Check if the address is null and provide default values or handle the case
    if (address == null) {
      // Handle the case where address is null (e.g., show an error message)
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.white,

            title: Text('Edit Address',style: TextStyle(
              color: Colors.red
            ),)),
        body: Center(
          child: Text('Error: Address data is null.'),
        ),
      );
    }

    controller.editname.value = address.name!?? '';
       controller.editlastName.value = address.lastName! ?? '';
    controller.editphone.value = address.phone!?? '';
    controller.editaddress.value = address.customerAddress!?? '';
    controller.editcity.value = address.customerCity!?? '';
     controller.editlandmark.value = address.customerLandmark!?? '';
       controller.editcountry.value = address.country!?? '';
    controller.editpincode.value = address.customerPincode!?? '';

    return Scaffold(
      appBar: AppBar(
          backgroundColor:
          Colors.white,title: Text('Edit Address',style: TextStyle(
        color: Colors.red
      ),)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: ListView(
          children: [
            TextFormField(
              onChanged: (value) => controller.editname.value = value,
              decoration: InputDecoration(labelText: 'Name'),
              initialValue: address.name, // Set the initialValue here
            ),
            TextFormField(
              onChanged: (value) => controller.editlastName.value = value,
              decoration: InputDecoration(labelText: 'Last Name'),
              initialValue: address.lastName?? '',  // Set the initialValue here
            ),
            TextFormField(
              onChanged: (value) => controller.editphone.value = value,
              decoration: InputDecoration(labelText: 'Phone'),
              initialValue: address.phone, // Set the initialValue here
            ),
            TextFormField(
              onChanged: (value) => controller.editaddress.value = value,
              decoration: InputDecoration(labelText: 'Address'),
              initialValue: address.customerAddress, // Set the initialValue here
            ),
            TextFormField(
              onChanged: (value) => controller.editcity.value = value,
              decoration: InputDecoration(labelText: 'City'),
              initialValue: address.customerCity, // Set the initialValue here
            ),
            TextFormField(
              onChanged: (value) => controller.editlandmark.value = value,
              decoration: InputDecoration(labelText: 'Landmark'),
              initialValue: address.customerLandmark, // Set the initialValue here
            ),
            TextFormField(
              onChanged: (value) => controller.editcountry.value = value,
              decoration: InputDecoration(labelText: 'Country'),
              initialValue: address.country ?? '',  // Set the initialValue here
            ),
            TextFormField(
              onChanged: (value) => controller.editpincode.value = value,
              decoration: InputDecoration(labelText: 'Pincode'),
              initialValue: address.customerPincode, // Set the initialValue here
            ),
            SizedBox(height: 16),
            ElevatedButton(

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
                controller.updateAddress(address.addressId);

                // Close the loading indicator dialog
                Get.back();

                // Navigate back
                Get.back();
              },




              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
