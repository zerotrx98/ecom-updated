import 'package:get/get.dart';

import '../controller/homescreen_cntrl.dart';

class HomescreenBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => HomeScreenCntrl());  }

}