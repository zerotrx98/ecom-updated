import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart'as http;
import 'about_modelclass.dart';

class AboutUsController extends GetxController {
  final RxBool showFullText = false.obs;
  var aboutList = <AboutElement>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    final response = await http.get(Uri.parse('YOUR_API_URL_HERE'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final aboutData = About.fromJson(jsonData);

      aboutList.assignAll(aboutData.about!);
    } else {
      // Handle error
      print('Error: ${response.reasonPhrase}');
    }
  }
  void toggleTextVisibility() {
    showFullText.toggle();
  }




}
