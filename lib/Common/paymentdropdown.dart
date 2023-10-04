import 'package:cybzone_neoline/Common/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/cart_screen/cntrl/cart_cntrl.dart';

class PaymentMethodDropdown extends StatelessWidget {
  final CartController paymentMethodController = Get.put(CartController());
  final TextEditingController _textEditingController = TextEditingController();

  PaymentMethodDropdown() {
    if (paymentMethodController.paymentMethods.isNotEmpty) {
      _textEditingController.text =
          paymentMethodController.paymentMethods.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textEditingController,
                readOnly: true,
                onTap: () {
                  _showDropdown(context);
                },
                style: TextStyle(fontSize: 16.0),
                // Adjust the font size if needed
                decoration: InputDecoration(
                  labelText: "PAYMENT METHOD",
                  labelStyle: TextStyle(fontSize: 14.0,color:sclr), // Adjust the font size here
                  suffixIcon: Icon(Icons.arrow_drop_down,color: sclr,),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red), // Change focused border color
                  ),
                  suffixStyle: TextStyle(color: Colors.red),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: paymentMethodController.paymentMethods
                  .map((String paymentMethod) {
                return ListTile(
                  title: Text(paymentMethod),
                  onTap: () {
                    paymentMethodController.selectedPaymentMethod.value =
                        paymentMethod;
                    _textEditingController.text = paymentMethod;
                    Get.back(); // Close the dialog
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class PhoneNumberFormField extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'WhatsApp Number',
        labelStyle: TextStyle(fontSize: 14.0,color: Colors.red), // Adjust the font size here

        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red), // Change focused border color
        ),// Display label without touch
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a WhatsApp number';
        }
        // You can add more validation logic if needed
        return null; // Return null if validation passes
      },
    );
  }
}

