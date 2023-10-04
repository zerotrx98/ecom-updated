import 'package:cybzone_neoline/Common/colors.dart';
import 'package:cybzone_neoline/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/paymentdropdown.dart';
import '../../../Common/texts.dart';
import '../../cart_screen/api/modelclass.dart';
import '../../cart_screen/cntrl/cart_cntrl.dart';
import '../cntrl/confrim_order_cntrl.dart';

class ConfirmOrder extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final ConfirmOrderController confirmOrderController =
      Get.put(ConfirmOrderController());

  ConfirmOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.arrow_back,
            )),
        backgroundColor: Colors.white,
        title: Text(
          'Order Confirm ',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Address",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.addressScreen);
                          },
                          child: Text(
                            "Add New Address",
                            style: TextStyle(
                                color: sclr, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      height: Get.height * 0.15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Obx(() {
                        if (confirmOrderController.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          // Use the data from the addressControl observable
                          final addressControl =
                              confirmOrderController.addressControl.value;
                          final firstAddress = addressControl.allAddress?.first;

                          // Build your UI using the fetched data
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  firstAddress?.name ?? ''.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      firstAddress?.customerAddress ?? '',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      firstAddress?.customerCity ?? '',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      firstAddress?.customerPincode ?? '',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  firstAddress?.customerLandmark ?? '',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  firstAddress?.phone ?? '',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          );
                        }
                      }),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        Headings(headings: 'items'),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cartController
                              .cartData.value.cart?[0].details?.length ??
                          0,
                      itemBuilder: (context, index) {
                        final cartProduct =
                            cartController.cartData.value.cart?[0];
                        final details = cartProduct?.details?[index];
                        final itemQuantity = cartController
                                .itemQuantities[details?.cartDetailsId ?? ''] ??
                            0;
                        return details != null
                            ? ProductItem(
                                cartProduct: cartProduct!,
                                details: details,
                                itemQuantity: itemQuantity,
                                index: index,
                              )
                            : Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Text('Product details not available.'),
                              );
                      },
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Headings(
                          headings: 'Bill Details',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade300, width: 1)),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sub Total "),
                              Obx(() {
                                return Text(
                                  " ₹${cartController.totalCartPrice.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                );
                              }),

                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tax "),
                              Text("₹0",style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Payable "),
                              Obx(() {
                                print('Total Cart Price: ${cartController.totalCartPrice}');
                                return Text(
                                  "₹${cartController.totalCartPrice.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Container(
                      height: Get.height * 0.07,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "₹23800 ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("saved so far on this order")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Container(
                      height: Get.height * 0.07,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_balance_wallet_rounded,
                              color: Colors.orange,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("You will earn"),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "23 points",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("from on this order")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Container(
                      height: Get.height * 0.07,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                                child: Text(
                              " cannot purchase more than one different product as cash on delivery"
                                  .toUpperCase(),
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            )),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Payable Amount"), // Change this line
                        Obx(() {
                          return Text(
                            "₹${cartController.totalCartPrice.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                      ],
                    ),

                    _buildPaymentOption("Online Payment Free Shipping", 0),
                    _buildPaymentOption(
                        "Pay COD (Additional Charge now (pay now Rs 200))", 1),
                    Container(
                      width: double.infinity,
                      height: Get.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: sclr,
                      ),
                      child: Center(
                        child: Text(
                          "PAY NOW",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String optionText, int index) {
    return InkWell(
      onTap: () {
        confirmOrderController.selectOption(index);
      },
      child: Row(
        children: [
          Obx(() => Radio(
                value: index,
                groupValue: confirmOrderController.selectedOption.value,
                onChanged: (int? value) {
                  confirmOrderController.selectOption(value!);
                },
              )),
          Text(
            optionText,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Cart cartProduct;
  final Detail? details;
  final int itemQuantity;
  final int index;

  const ProductItem({
    required this.cartProduct,
    required this.details,
    required this.index,
    required this.itemQuantity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    final RxDouble calculatedPrice = 0.0.obs;

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Column(
        children: [
          if (details != null)
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.productsDetails, arguments: details?.productId);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Container(
                      height: Get.height * 0.06,
                      width: Get.width * 0.14,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(details?.productImage ?? ''),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        details?.productName ?? 'Product Name Not Available',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Obx(() {
                        final currentQuantity =
                            cartController.itemQuantities[details?.cartDetailsId ?? ''] ?? 0;

                        calculatedPrice.value = currentQuantity *
                            (double.parse(details?.itemOfferPrice ?? '0.0'));

                        return Text(
                          calculatedPrice.value.toStringAsFixed(2),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            )
          else
            Container(
              alignment: Alignment.center,
              child: Text('Product details not available.'),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  cartController.removeFromCartApi(productId: details?.cartDetailsId ?? '');
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Remove x",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.050,
                width: Get.width * 0.25,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        final productId = details?.productId ?? '';
                        final price = details?.itemOfferPrice ?? '';
                        final offerPrice = details?.itemOfferPrice ?? '';

                        cartController.decreaseCount(details?.cartDetailsId ?? '', productId, price, offerPrice);

                      },
                      child: Text(
                        "-",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Obx(() {
                      final currentQuantity = cartController.itemQuantities[details?.cartDetailsId ?? ''] ?? 0;

                      return Text(
                        currentQuantity.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      );
                    }),
                    GestureDetector(
                      onTap: () {
                        final productId = details?.productId ?? '';
                        final price = details?.itemOfferPrice ?? '';
                        final offerPrice = details?.itemOfferPrice ?? '';

                        cartController.increaseCount(details?.cartDetailsId ?? '', productId, price, offerPrice);

                      },
                      child: Text(
                        "+",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
