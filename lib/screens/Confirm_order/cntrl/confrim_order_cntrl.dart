import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../Common/loginAuth/login_controller/authecontle.dart';
import '../apicall/addressApi.dart';
import '../apicall/orderconfirm_model.dart';

class ConfirmOrderController extends GetxController {
  var selectedOption = 0.obs; // Observable for selected option
  var addressControl = AddressControl().obs; // Observable for address control data
  var isLoading = true.obs; // Observable for loading state
  AuthController authController = Get.put(AuthController());
  String customerId = '';
  @override
  void onInit() {
    super.onInit();
    customerId = authController.customerId.value; // Get the customerId here

    fetchAddressControlData();
  }

  void fetchAddressControlData() async {
    try {
      isLoading.value = true;
      final fetchedData = await AddressApi().getAddressControl(customerId);
      addressControl.value = fetchedData;
    } catch (error) {
      // Handle error, show error message, etc.
    } finally {
      isLoading.value = false;
    }
  }

  void selectOption(int optionIndex) {
    selectedOption.value = optionIndex;
  }
}
