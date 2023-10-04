import 'package:get/get.dart';
import '../../../Common/loginAuth/login_controller/authecontle.dart';
import '../api/modelclass.dart';
import '../api/order_history_api.dart';

class OrderHistoryController extends GetxController {
  AuthController authController = Get.put(AuthController());
  String customerId = '';
  final orderHistory = OrderHistory().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    customerId = authController.customerId.value;

    print('Initializing OrderHistoryController');
    fetchOrderHistory();
  }

  Future<void> fetchOrderHistory() async {
    try {
      isLoading(true);

      print('Fetching order history for customer: $customerId');
      final response = await OrderHistoryApi.fetchOrderHistory(customerId);
      orderHistory.value = response;
      print('Order history fetched successfully');
    } catch (e) {
      print('Error fetching order history: $e');
      Get.snackbar('Error', 'Failed to fetch order history: $e');
    } finally {
      isLoading(false);
      print('Fetching process complete');
    }
  }
}
