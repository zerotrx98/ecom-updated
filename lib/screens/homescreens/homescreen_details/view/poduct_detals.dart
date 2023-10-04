import 'package:cybzone_neoline/Common/Bottomsheetcntrl.dart';
import 'package:cybzone_neoline/Common/colors.dart';
import 'package:cybzone_neoline/Common/texts.dart';
import 'package:cybzone_neoline/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Common/Review/cntrl/review_cnrl.dart';
import '../../../../Common/bottomsheetLogin.dart';
import '../../../../Common/loginAuth/login_controller/authecontle.dart';
import '../../home_screen/controller/homescreen_cntrl.dart';
import '../../view_all_products/cntrl/products_cntrl.dart';
import 'cntrl/product_details_cntrl.dart';

class ProductsDetails extends StatelessWidget {
  final ReviewController _controller = Get.put(ReviewController());
  final ProductDetailsController _Productioncontroller =
      Get.put(ProductDetailsController());

  ProductsDetails({super.key});

  final HomeScreenCntrl categoriesProductController =
      Get.put(HomeScreenCntrl());
  final ProductController productController = Get.put(ProductController());

  final BottomSheetController bottomSheetController =
      Get.put(BottomSheetController());

  // final RxBool isClicked = false.obs;


  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();

    return Scaffold(
        resizeToAvoidBottomInset: true, // Set this property to true

        appBar: AppBar(
          backgroundColor: Colors.white,
          // actions: [
          //   Shimmer.fromColors(
          //     baseColor: Colors.grey[300],
          //     highlightColor: Colors.grey[100],
          //     child: IconButton(
          //       icon: Icon(Icons.search, color: Colors.black),
          //       onPressed: () {
          //         // Handle search icon press
          //       },
          //     ),
          //   ),
          //   Shimmer.fromColors(
          //     baseColor: Colors.grey[300],
          //     highlightColor: Colors.grey[100],
          //     child: IconButton(
          //       icon: Icon(Icons.shopping_cart, color: Colors.black),
          //       onPressed: () {
          //         // Handle cart icon press
          //       },
          //     ),
          //   ),
          // ],
        ),
        bottomNavigationBar: _getBottomNavigationBar(),
        body: SingleChildScrollView(
          child: Obx(() {
            if (_Productioncontroller.productDetails.value.details == null) {
              return  ShimmerLoading();
            }

            final product = _Productioncontroller.productDetails.value.details!;
            double calculatePercentageDiscount(
                double mrp, double sellingPrice) {
              return ((mrp - sellingPrice) / mrp) * 100;
            }

            return Column(
              children: [
                Container(
                  height: Get.height * 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      image: DecorationImage(
                          image: NetworkImage(product.productImage.toString()),
                          fit: BoxFit.fill)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          product.productName.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "\u20B9 ${product.sellingPrice}",
                            // Unicode for the rupee symbol
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Text(
                            "\u20B9 ${product.mrp}",
                            // Unicode for the rupee symbol
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.03,
                          ),
                          SizedBox(
                            height: 20,
                            width: 60,
                            child: CustomPaint(
                              painter: PriceTagPaint(),
                              child: Align(
                                alignment: Alignment(-.2, 0), //litle left
                                child: Text(
                                  "${calculatePercentageDiscount(double.parse(product.mrp.toString()), double.parse(product.sellingPrice.toString())).toStringAsFixed(0)}% Off",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              {
                                if (authController.isLoggedIn.value) {
                                  // Add the async keyword here

                                  await productController.toggleFavorite(
                                    product.productId.toString(),
                                    product.mrp.toString(),
                                    product.sellingPrice.toString(),
                                  ); // Navigate to the wishlist screen
                                } else {
                                  LoginBottomSheetManager.showLoginBottomSheet(
                                      authController,
                                      context); // Show the login bottom sheet
                                }
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Obx(() {
                                bool isFavorited = productController
                                    .favoriteProductIds
                                    .contains(
                                  product.productId.toString(),
                                );
                                return Icon(
                                  isFavorited
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 15,
                                  color: isFavorited ? Colors.red : null,
                                );
                              }),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          InkWell(
                            onTap: () async {
                              try {
                                await FlutterShare.share(
                                  title: 'Check out this product!',
                                  text: '${product.productName}',
                                  linkUrl:
                                      'https://ecom.laurelss.com/${product.urlSlug}-${product.productId}',
                                  chooserTitle: 'Share Product',
                                );
                              } catch (e) {
                                print('Error sharing: $e');
                              }
                            },
                            child: Icon(
                              Icons.share,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_balance_wallet_rounded,
                        size: 15,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "You will earn ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            TextSpan(
                              text: "18 points",
                              style: TextStyle(
                                color: Colors.black,
                                // You can use any color you prefer
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " from this product",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Colors :",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: Get.height * 0.05,
                        width: Get.width * 0.2,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            product.stockss?[0].varientName ??
                                "No Color".toUpperCase(),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Column(
                          children: [
                            // Text(
                            //   "Electric Remote Control Su 27 Foam Adult Airplane Plane Kit Model Toy Rc Su27 Aircraft Planes Fighters Jet Buy Jet Fighters Toy Su 27 Product on",
                            //   style: TextStyle(fontWeight: FontWeight.bold),
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(product.productDescription.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Reviews and Ratings',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "4.8",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              "Based on 4 reviews",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      // Adding the LinearPercentIndicator
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: GestureDetector(
                          onTap: () => _Productioncontroller.showBottomSheet(context,product.productId.toString()),
                          child: Container(
                            height: Get.height * 0.05,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.red)),
                            child: Center(
                              child: Text(
                                "Write A Review",
                                style: TextStyle(
                                    color: sclr, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Headings(headings: "Related Products"),
                    ],
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: _Productioncontroller
                      .relatedProducts.value.rproducts!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final product = _Productioncontroller
                        .relatedProducts.value.rproducts![index];
                    return GestureDetector(
                      onTap: () {
                        // Handle the product tap
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.productsDetails);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                spreadRadius: 1,
                                                blurRadius: 5,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                product!.productImage
                                                    .toString(), // Assuming this holds the image URL
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  child: Text(
                                    product.productName ?? '',
                                    // Display the product name
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  height: Get.height * 0.07,
                                  width: Get.width * 0.9,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "\u20B9 ${product.sellingPrice ?? '0.00'}",
                                          // Display the selling price
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
                                          "\u20B9 ${product.mrp ?? '0.00'}",
                                          // Display the MR price
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // ... Other parts of your code for building the product
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            );
          }),
        ));
  }
  Widget ShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey,
      child: Column(
        children: [
          Container(
            height: Get.height * 0.5,
            width: double.infinity,
            color: Colors.grey.shade500,
          ),
          // Add shimmer placeholders for other parts of your UI as needed
        ],
      ),
    );
  }
  Widget _getBottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false, // Hide selected label
      showUnselectedLabels: false, // Hide unselected label
      items: [
        BottomNavigationBarItem(
          icon: Obx(() {
            if (_Productioncontroller.productDetails.value.details == null) {
              return Container();
            }

            final product = _Productioncontroller.productDetails.value.details!;

            if (!_Productioncontroller.isClicked.value) {
              return InkWell(
                onTap: () {
                  _Productioncontroller.incrementCartCount(
                    productId: product.productId.toString(),
                    price: product.mrp.toString(),
                    offerPrice: product.sellingPrice.toString(),
                  );
                  _Productioncontroller.toggleClickedState();
                },
                child: Container(
                  width: Get.width * 0.45,
                  height: Get.height * 0.05,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "+ Add",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              final addButtonSize = Size(Get.width * 0.45, Get.height * 0.05);

              return InkWell(
                onTap: () {
                  _Productioncontroller.toggleClickedState();
                  _Productioncontroller.showCountInputBottomSheet();
                },
                child: Container(
                  width: Get.width * 0.45,
                  height: Get.height * 0.05,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          _Productioncontroller.decrementCartCount(
                            productId: product.productId.toString(),
                            price: product.mrp.toString(),
                            offerPrice: product.sellingPrice.toString(),
                          );
                          _Productioncontroller.toggleClickedState();
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              "-",
                              style: TextStyle(
                                fontSize: addButtonSize.height * 0.8,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(() => Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 1),
                            child: Text(
                              '${_Productioncontroller.cartCount.value}',
                              style: TextStyle(
                                fontSize: addButtonSize.height / 2,
                                color: Colors.red,
                              ),
                            ),
                          )),
                      InkWell(
                        onTap: () {
                          _Productioncontroller.incrementCartCount(
                            productId: product.productId.toString(),
                            price: product.mrp.toString(),
                            offerPrice: product.sellingPrice.toString(),
                          );
                          _Productioncontroller.toggleClickedState();
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontSize: addButtonSize.height * 0.8,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              _Productioncontroller.cartCount.value = 1;
              _Productioncontroller.addToCartIfNeeded(
                productId: _Productioncontroller
                    .productDetails.value.details!.productId
                    .toString(),
                price: _Productioncontroller.productDetails.value.details!.mrp
                    .toString(),
                offerPrice: _Productioncontroller
                    .productDetails.value.details!.sellingPrice
                    .toString(),
              );
              Get.toNamed(Routes.cart);

              Get.toNamed(Routes.cart);
            },
            child: Container(
              width: Get.width * 0.45,
              height: Get.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: sclr,
              ),
              child: Center(
                  child: Text(
                "Buy Now",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          label: 'Buy Now',
        ),
      ],
    );
  }
}

class PriceTagPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    Path path = Path();

    path
      ..lineTo(size.width * .85, 0) // .85 amount of right gap
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width * .85, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
