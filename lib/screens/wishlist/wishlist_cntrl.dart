import 'package:get/get.dart';
import '../../Common/loginAuth/login_controller/authecontle.dart';
import 'apicall/apicall.dart';
import 'apicall/modelclass.dart';

class MyWishlistController extends GetxController {
  AuthController authController = Get.put(AuthController());
  String customerId = ''; // Initialize customerId here

  var isLoading = true.obs;
  var wishlist = MyWishlist().obs;
  var wishCount = 0.obs;  // Create an observable to store the wish_count
  var detailsList = <Detail>[].obs; // Create an observable list for details

  @override
  void onInit() {

    super.onInit();
    customerId = authController.customerId.value; // Get the customerId here

    fetchWishlist();  // Call fetchWishlist when the controller initializes
  }

  Future<void> fetchWishlist(

      ) async {
    try {
      isLoading(true);
      final WishlistApi api = WishlistApi();  // Instantiate your Api class
      final MyWishlist fetchedWishlist = await api.fetchWishlist(customerId);

      wishlist(fetchedWishlist);

      wishCount(int.parse(fetchedWishlist.wishlist?[0]?.wishCount ?? '0'));
      detailsList.assignAll(fetchedWishlist.wishlist?[0]?.details ?? []);
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  Future removeProduct( productId) async {
    try {
      isLoading(true);

      final WishlistApi api = WishlistApi(); // Instantiate your Api class
      await api.removeProductFromWishlist(customerId, productId);

      await fetchWishlist();
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }



}
