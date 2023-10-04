import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'loginAuth/login_controller/authecontle.dart';

class LoginBottomSheetManager {
  static Future<void> showLoginBottomSheet(AuthController authController, BuildContext context) async {
    bool showSignUpFields = false; // Initially not showing SignUp fields

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Add the welcome text here
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                        ),
                      ),
                      SizedBox(height: 16), // Add spacing below the welcome text
                      if (!showSignUpFields) // Only show login fields if not signing up
                        Column(
                          children: [
                            TextField(
                              controller: authController.email,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height*0.02,),
                            TextField(
                              controller: authController.password,
                              decoration: InputDecoration(labelText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)
                                  )),
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () async {
                                await authController.submitFormToBackend();

                                if (authController.isLoggedIn.value) {
                                  Navigator.pop(context); // Close the bottom sheet
                                } else {
                                  // Handle login failure
                                }
                              },
                              child: Text('Log In'),
                            ),
                          ],
                        ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showSignUpFields = !showSignUpFields;
                          });
                        },
                        child: Text(showSignUpFields ? 'Hide Sign Up' : 'Sign Up'),
                      ),
                      if (showSignUpFields)
                        Column(
                          children: [
                            TextField(
                              controller: authController.nameController,
                              decoration: InputDecoration(labelText: 'Name',
                                  border: OutlineInputBorder(                              borderRadius: BorderRadius.circular(15)
                                  )),
                            ),
                            SizedBox(height: Get.height*0.02,),
                            TextField(
                              controller: authController.lastNameController,
                              decoration: InputDecoration(labelText: 'Last Name',
                                  border: OutlineInputBorder(                              borderRadius: BorderRadius.circular(15)
                                  )),
                            ),                          SizedBox(height: Get.height*0.02,),

                            TextField(
                              controller: authController.phoneController,
                              decoration: InputDecoration(labelText: 'Phone',
                                  border: OutlineInputBorder(                              borderRadius: BorderRadius.circular(15)
                                  )),
                            ),                          SizedBox(height: Get.height*0.02,),

                            TextField(
                              controller: authController.emailController,
                              decoration: InputDecoration(labelText: 'Email',
                                  border: OutlineInputBorder(                              borderRadius: BorderRadius.circular(15)
                                  )),
                            ),                          SizedBox(height: Get.height*0.02,),

                            TextField(
                              controller: authController.passwordController,
                              decoration: InputDecoration(labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                              )

                              ),
                              obscureText: true,
                            ),                          SizedBox(height: Get.height*0.02,),

                            ElevatedButton(
                              onPressed: () async {
                                await authController.signup();
                              },
                              child: Text('Sign Up'),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
