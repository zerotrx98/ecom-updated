import 'package:flutter/material.dart';

import 'colors.dart'; // Make sure to import the necessary package

class Headings extends StatelessWidget {
  final String headings; // Use 'final' and specify the data type

  Headings( { required this.headings});

  @override
  Widget build(BuildContext context) {
    return Text(
      headings,
      style: TextStyle(fontSize: 16,color: txclr,fontWeight: FontWeight.bold), // You can customize the text style here
    );
  }
}
