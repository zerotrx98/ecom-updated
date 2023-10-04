import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../cntrl/profile_controller.dart';

class EditProfile extends StatelessWidget {
  final ProfileController _controller = Get.put(ProfileController());
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    // Access the values from ProfileController
    final name = _controller.name.value;
    final last_name = _controller.name.value;

    final email = _controller.email.value;
    final phone = _controller.phone.value;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Edit profile',
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: (value) => _controller.name.value = value,
                // Set the initial value
                controller: TextEditingController(text: name),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),    TextField(
                decoration: InputDecoration(
                  labelText: 'last name',
                ),
                onChanged: (value) => _controller.name.value = value,
                // Set the initial value
                controller: TextEditingController(text: last_name),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                onChanged: (value) => _controller.email.value = value,
                controller: TextEditingController(text: email),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone',
                ),
                onChanged: (value) => _controller.phone.value = value,
                controller: TextEditingController(text: phone),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Old Password',
                ),
                controller: _controller.oldPasswordController,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'New Password',
                  suffixIcon: IconButton(
                    // Toggle the visibility of the new password
                    icon: Icon(
                      isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      isPasswordVisible = !isPasswordVisible;
                      // Trigger a rebuild of the widget
                      Get.forceAppUpdate();
                    },
                  ),
                ),
                controller:_controller.newPasswordController,
                // Toggle the obscureText based on isPasswordVisible
                obscureText: !isPasswordVisible,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Show loading indicator
                  Get.dialog(
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  );

                  // Simulate a delay (you can replace this with your actual save logic)
                  await Future.delayed(Duration(seconds: 2));

                  // Save address
                  _controller.updateProfile();

                  // Close the loading indicator dialog
                  Get.back();

                  // Navigate back
                  Get.back();
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
