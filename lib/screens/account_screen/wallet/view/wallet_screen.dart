import 'package:cybzone_neoline/Common/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,        title: Text("My Wallet",style: TextStyle(
        color: Colors.black
      ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
              child: Container(
                height: Get.height*0.1,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300

                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Total Wallet Points",style: TextStyle(
                            fontWeight: FontWeight.bold,color: sclr
                          ),),
                          SizedBox(height: Get.height*0.01,),
                          Text("0",style: TextStyle(
                            color:sclr,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Icon(Icons.account_balance_wallet,color: Colors.orange,size: 20,)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Wallet Activity",style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
