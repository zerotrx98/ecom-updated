import 'package:cybzone_neoline/Common/colors.dart';
import 'package:cybzone_neoline/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Common/Bottomsheetcntrl.dart';
import '../../../../Common/Image_Slider/view/image_slider.dart';
import '../../../../Common/about_us/about_us.dart';
import '../../../../Common/bottomsheetLogin.dart';
import '../../../../Common/loginAuth/login_controller/authecontle.dart';
import '../../../../Common/texts.dart';
import '../../browse_categories/view/BrowseCategories_product_.dart';
import '../../view_all_products/cntrl/products_cntrl.dart';
import '../controller/homescreen_cntrl.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeScreenCntrl homeScreenCntrl = Get.put(HomeScreenCntrl());
  final bottomSheetController = Get.put(BottomSheetController());
  final ProductController productController = Get.put(ProductController());

  ScrollController _scrollController = ScrollController();
  final RxBool isClicked = false.obs;

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        productController.currentPage.value++;
        productController.fetchProducts();
      }
    });
    AuthController authController = Get.find<AuthController>();
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        // Adjust the top padding as needed
                        child: Image.asset(
                          "assets/images/icons/logoscrnremovebg.png",
                          scale: 10,
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        // Adjust the top padding as needed
                        child: Image.asset(
                          "assets/images/icons/whatsapp.png",
                          scale: 25,
                        ),
                      ),

                      // Container(
                      //   height: Get.height*0.03,
                      //   width: Get.width*0.07,
                      //   decoration: BoxDecoration(
                      //     color: Colors.grey,
                      //      image: DecorationImage(image: NetworkImage("https://th.bing.com/th/id/OIP.vBzeU65JZbukjmEX9q50xgHaHZ?pid=ImgDet&rs=1"),fit: BoxFit.fill)
                      //   ),
                      //
                      // )
                    ],
                  ),
                )),
            SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                sliver: SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.searchscreen);
                    },
                    child: Container(
                      height: Get.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: txclr,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Search for a product',
                              style: TextStyle(
                                fontSize: 14,
                                color: txclr,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              sliver: SliverToBoxAdapter(
                child: ImageSlider(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Headings(
                      headings: 'Browse Categories',
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              sliver: SliverToBoxAdapter(
                child: BrowseCategories(

                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Headings(
                      headings: 'Products',
                    ),
                  ],
                ),
              ),
            ),


            Obx(() {

                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.60,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      final countdata =
                      productController.productscount[index];
                      final product = productController.productsdata[index];
                      return Padding(
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
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.productsDetails,
                                          arguments: product.productId);
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
                                                product.productImage
                                                    .toString(), // Assuming productImage is a list of image URLs
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: InkWell(
                                        onTap: () async {
                                          {
                                            if (authController
                                                .isLoggedIn.value) {
                                              // Add the async keyword here

                                              await productController
                                                  .toggleFavorite(
                                                product.productId.toString(),
                                                product.mrp.toString(),
                                                product.sellingPrice
                                                    .toString(),
                                              ); // Navigate to the wishlist screen
                                            } else {
                                              LoginBottomSheetManager
                                                  .showLoginBottomSheet(
                                                  authController,
                                                  context); // Show the login bottom sheet
                                            }
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                            BorderRadius.circular(30),
                                          ),
                                          child: Obx(() {
                                            bool isFavorited =
                                            productController
                                                .favoriteProductIds
                                                .contains(
                                              product.productId.toString(),
                                            );
                                            return Icon(
                                              isFavorited
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              size: 15,
                                              color: isFavorited
                                                  ? Colors.red
                                                  : null,
                                            );
                                          }),
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
                                    product.productName ?? 'No Name',
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
                                          "\u20B9 ${product.sellingPrice ??
                                              'N/A'}",
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
                                          "\u20B9 ${product.mrp ?? 'N/A'}",
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
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: GestureDetector(
                                          onTap: () {
                                            bottomSheetController
                                                .openBottomSheet();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            width: double.infinity,
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceAround,
                                                mainAxisSize:
                                                MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    "Colors",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                  Icon(Icons
                                                      .arrow_drop_down_sharp),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: Get.height * 0.01),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.red,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          width: double.infinity,
                                          child: GestureDetector(
                                            onTap: () async {
                                              if (authController.isLoggedIn.value) {
                                                String customerId = authController.customerId.value;

                                                int cartCount = countdata.cartQuantity.value; // Current cart count

                                                // If the product hasn't been added to the cart, set the count to 1
                                                if (!countdata.isProductClicked.value) {
                                                  cartCount = 1;
                                                }

                                                // Make the API call to add to cart
                                                await productController.addToCart(
                                                  customerId: customerId,
                                                  productId: product.productId.toString(),
                                                  price: product.mrp.toString(),
                                                  offerPrice: product.sellingPrice.toString(),
                                                  nos: cartCount.toString(),
                                                );

                                                // Update the local counter and UI
                                                productController.incrementCartCount();
                                                countdata.cartQuantity.value = cartCount;
                                                countdata.isProductClicked.value = true;
                                              } else {
                                                // Show the login bottom sheet
                                                LoginBottomSheetManager.showLoginBottomSheet(authController, context);
                                              }
                                            },
                                            child: Obx(
                                                  () => Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  if (!countdata.isProductClicked.value)
                                                    Container(
                                                      padding: EdgeInsets.symmetric(vertical: 4),
                                                      child: Center(
                                                        child: Text(
                                                          "+ Add",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.red,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (countdata
                                                          .isProductClicked
                                                          .value)
                                                        InkWell(
                                                          onTap: () async {
                                                            productController
                                                                .decrementCartCount();
                                                            countdata
                                                                .cartQuantity
                                                                .value--;
                                                            countdata
                                                                .isProductClicked
                                                                .value =
                                                                countdata
                                                                    .cartQuantity
                                                                    .value >
                                                                    0;
                                                            String customerId =
                                                                authController
                                                                    .customerId
                                                                    .value;

                                                            await productController
                                                                .addToCart(
                                                              customerId:
                                                              customerId,
                                                              productId: product
                                                                  .productId
                                                                  .toString(),
                                                              price: product.mrp
                                                                  .toString(),
                                                              offerPrice: product
                                                                  .sellingPrice
                                                                  .toString(),
                                                              nos: countdata
                                                                  .cartQuantity
                                                                  .value
                                                                  .toString(),
                                                            );
                                                            // Call the addToCart function with the updated count
                                                          },
                                                          child: Container(
                                                            child: Center(
                                                              child: Text(
                                                                "-",
                                                                style: TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  color:
                                                                  Colors.red,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (countdata
                                                          .isProductClicked
                                                          .value)
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                              horizontal: 6,
                                                              vertical: 1),
                                                          child: Text(
                                                            '${countdata
                                                                .cartQuantity
                                                                .value}',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color:
                                                                Colors.red),
                                                          ),
                                                        ),
                                                      if (countdata
                                                          .isProductClicked
                                                          .value)
                                                        InkWell(
                                                          onTap: () async {
                                                            productController
                                                                .incrementCartCount();
                                                            countdata
                                                                .cartQuantity
                                                                .value++;
                                                            countdata
                                                                .isProductClicked
                                                                .value = true;
                                                            String customerId =
                                                                authController
                                                                    .customerId
                                                                    .value;

                                                            await productController
                                                                .addToCart(
                                                              customerId:
                                                              customerId,
                                                              productId: product
                                                                  .productId
                                                                  .toString(),
                                                              price: product.mrp
                                                                  .toString(),
                                                              offerPrice: product
                                                                  .sellingPrice
                                                                  .toString(),
                                                              nos: countdata
                                                                  .cartQuantity
                                                                  .value
                                                                  .toString(),
                                                            );
                                                          },
                                                          child: Container(
                                                            child: Center(
                                                              child: Text(
                                                                "+",
                                                                style: TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  color:
                                                                  Colors.red,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: productController.productsdata.length,
                  ),
                );

            }


            ),


            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.sortscreen);
                      },
                      child: Container(
                        height: Get.height * 0.05,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red),
                        child: Center(
                          child: Text(
                            "View All products",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),


            SliverToBoxAdapter(
              child: AboutUsScreen(),
            ),
          ],
        ),
      ),

      // ... Rest of the code ...
    );
  }
}
