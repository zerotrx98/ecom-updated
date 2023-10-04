import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors.dart';
import '../texts.dart';
import 'about_us_cntrl.dart';

class AboutUsScreen extends StatelessWidget {
  final AboutUsController controller = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Headings(
                    headings: 'About Us',
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(() {
                final aboutElements = controller.aboutList;
                if (aboutElements.isEmpty) {
                  return CircularProgressIndicator(); // You can display a loading indicator here
                }
                final aboutText = aboutElements[0].abContent ?? '';

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      aboutText,
                      style: TextStyle(fontSize: 12, color: txclr),
                      textAlign: TextAlign.start,
                      maxLines: controller.showFullText.value ? null : 4,
                    ),
                    InkWell(
                      onTap: () {
                        controller.toggleTextVisibility();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          controller.showFullText.value ? 'See Less' : 'See More',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    )
                  ],
                );
              }),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Headings(
                    headings: 'CONNECT WITH US',
                  ),
                ],
              ),
              // Add your content for connecting with us here
            ],
          ),
        ),
      ),
    );
  }
}
