import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FavoriteButton extends StatelessWidget {
  final RxBool _isFavorite = false.obs;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _isFavorite.value = !_isFavorite.value; // Toggle the favorite status
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Obx(() => Icon(
          _isFavorite.value ? Icons.favorite : Icons.favorite_border, // Toggle between favorite and unfavorite icons
          size: 15,
          color: _isFavorite.value ? Colors.red : null, // Set color to red if favorited, otherwise null (default)
        )),
      ),
    );
  }
}
