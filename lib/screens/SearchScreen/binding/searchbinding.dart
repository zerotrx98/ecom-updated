import 'package:get/get.dart';

import '../controller/search_cntrl.dart';

class SearchBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SearchCntrl());
    // TODO: implement dependencies
  }

}