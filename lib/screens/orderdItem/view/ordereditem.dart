import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Common/colors.dart';
import '../../../Common/loginAuth/login_controller/authecontle.dart';
import '../../../Routes/routes.dart';
import '../controller/history_controller.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderHistoryController orderHistoryController = Get.put(OrderHistoryController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Orders",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.searchscreen);
                },
                child: Container(
                  height: Get.height * 0.05,
                  width: double.infinity,
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
            ),
            Divider(),
            Obx(() {
              if (orderHistoryController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (orderHistoryController.orderHistory.value.orders?.order == null) {
                return Center(
                  child: Text('No orders found.'),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: orderHistoryController.orderHistory.value.orders!.order!.length,
                  itemBuilder: (context, index) {
                    final order = orderHistoryController.orderHistory.value.orders!.order![index];
                    return Column(
                      children: [
                        ListTile(
                          leading: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(order.orderDetails![0].productImage ?? ''),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(order.orderDetails![0].productName ?? ''),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4),
                              Text(
                                "Delivered at '${order.deliveryDate}'",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              // ... other details ...
                            ],
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
