import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../colors.dart';
import '../Controller/image_slider_cntrl.dart';

class ImageSlider extends StatelessWidget {
  final BannerController _bannerController = Get.put(BannerController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          if (_bannerController.isLoading.value) {
            return Container();
          } else {
            return ImageSlideshow(
              width: double.infinity,
              height: Get.height * 0.23,
              children: _bannerController.bannerImages.value.banners?.map((banner) {
                return GestureDetector(
                  onTap: () {
                    _bannerController.onImageTapped(banner.bannerUrl ?? "");
                  },
                  child: Image.network(banner.bannerImage ?? ""),
                );
              }).toList() ?? [],
              initialPage: _bannerController.currentIndex.value,
              onPageChanged: (index) {
                _bannerController.currentIndex.value = index;
              },
              autoPlayInterval: 3000,
              isLoop: true,
              indicatorColor: sclr, // Customize the color of the active dot
              indicatorBackgroundColor: Colors.grey, // Customize the color of inactive dots
            );
          }
        }),
      ],
    );
  }
}
