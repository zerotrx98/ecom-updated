import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/bottomsheetLogin.dart';
import '../../../Common/colors.dart';
import '../../../Common/loginAuth/login_controller/authecontle.dart';
import '../../../Routes/routes.dart';
import '../cntrl/profile_controller.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final AuthController authController = Get.find<AuthController>();
  ProfileController profileController = Get.put(ProfileController());
  final List<Category> categories = [
    Category('Manage Addresses'),
    Category('Wishlist'),
    Category('Review and Rating'),
    Category('Share Store with Family'),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (authController.isLoggedIn.value) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              GestureDetector(
                onTap: () {
                  showPopupMenu(context);
                },
                child: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              )
            ],
            title: Text(
              "My Account",
              style: TextStyle(color: Colors.black),
            ),
            leading: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: Get.height * 0.2,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          foregroundImage: NetworkImage(
                              "https://cdn4.iconfinder.com/data/icons/gray-user-management/512/rounded-512.png"),
                          backgroundColor: Colors.white,
                          radius: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi,",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.01,
                                  ),
                                  Obx(() {
                                    final profile = profileController.profile.value;
                                    if (profile == null || profile.customer == null) {
                                      return CircularProgressIndicator();
                                    } else {
                                      return Text(
                                        profile.customer!.customerName.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: sclr,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    }
                                  }),
                                ],
                              ),
                              Obx(() {
                                final profile = profileController.profile.value;
                                if (profile == null || profile.address == null) {
                                  return CircularProgressIndicator();
                                } else {
                                  return Text(
                                    profile.address!.phone.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  );
                                }
                              }),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.25,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.editProfile);
                            },
                            child: Icon(Icons.mode_edit_outline_sharp))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    height: Get.height * 0.5, // Adjust the height as needed
                    child: ListView.separated(
                      itemCount: categories.length,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(),
                      // Divider between items
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            switch (index) {
                              case 0: // Manage Addresses
                                Get.toNamed(Routes.savedAddress);
                                break;
                              case 1: // Wishlist
                                Get.toNamed(Routes.wishlist);
                                break;


                              case 2: // Review and Rating
                                Get.toNamed(Routes.reviews);
                                break;
                              case 3: // Share Store with Family
                                Get.toNamed(Routes.confirmOrder);
                                break;
                            }
                          },
                          child: ListTile(
                              title: Text(categories[index].name),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              )),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          body: Center(
            child: Obx(() {
              if (authController.isLoggedIn.value) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome, User!'),
                    SizedBox(height: 20),
                    Text('Customer ID: ${authController.customerId.value}'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Log Out'),
                    )
                  ],
                );
              } else {
                return Column(
                  children: [
                    Container(
                      height: Get.height * 0.8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/demo.png"))),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        LoginBottomSheetManager.showLoginBottomSheet(
                            authController, context);
                      },
                      child: Text(
                        'SIGN IN / SIGN UP',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                );
              }
            }),
          ),
        );
      }
    });
  }

  void showPopupMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;
    final Offset offset = Offset(0, overlay.size.height);

    showMenu(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      context: context,
      position: RelativeRect.fromLTRB(50, 50, 0, 0),
      items: [
        PopupMenuItem(
          child: GestureDetector(
              onTap:     ()
    {
      authController.logout();
    },

              child: Text('Sign Out',style: TextStyle(
                color: Colors.red,fontWeight: FontWeight.bold
              ),)),
        ),
      ],
    );
  }
}

class Category {
  final String name;

  Category(this.name);
}
