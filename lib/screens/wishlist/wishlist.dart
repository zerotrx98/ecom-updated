import 'package:cybzone_neoline/screens/wishlist/wishlist_cntrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Routes/routes.dart';
import 'apicall/modelclass.dart';

class WishList extends StatelessWidget {
  WishList({super.key});
  final MyWishlistController wishlistController = Get.put(MyWishlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Wishlist",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(() {
        if (wishlistController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (wishlistController.wishlist.value.wishlist == null || wishlistController.wishlist.value.wishlist!.isEmpty) {
          return Center(child: Text("No items in the wishlist."));
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  children: List.generate(
                    wishlistController.detailsList.length,
                        (index) {
                      final detail = wishlistController.detailsList[index];

                      return GestureDetector(
                        onTap: () {



                            Get.toNamed(Routes.productsDetails,
                                arguments: detail.productId);



                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white60,
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.3),
                                                spreadRadius: 1,
                                                blurRadius: 5,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(detail.productImage ?? ''),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    height: Get.height * 0.07,
                                    width: Get.width * 0.9,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: Get.height * 0.01,
                                        horizontal: Get.width * 0.01,
                                      ),
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              detail.productName ?? '',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.012,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "\u20B9 ${detail.itemOfferPrice ?? ''}",
                                                style: TextStyle(
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              SizedBox(
                                                width: Get.width * 0.02,
                                              ),
                                              Text(
                                                "\u20B9 ${detail.itemPrice ?? ''}",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                  decoration: TextDecoration.lineThrough,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.01,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Move To Cart",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async{

                                       await wishlistController.removeProduct(detail.wishlistDetailsId);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
