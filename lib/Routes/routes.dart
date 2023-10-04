import 'package:cybzone_neoline/demotry.dart';
import 'package:cybzone_neoline/screens/account_screen/wallet/view/wallet_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Common/Review/view/review.dart';
import '../Common/bottomnav.dart';
import '../Common/splashScreen.dart';
import '../screens/Categories/binding/categories_binding.dart';
import '../screens/Categories/view/categories.dart';
import '../screens/Confirm_order/view/confirm_orders.dart';
import '../screens/SearchScreen/binding/searchbinding.dart';
import '../screens/SearchScreen/view/search_screen.dart';
import '../screens/account_screen/Address/view/address.dart';
import '../screens/account_screen/Address/view/edit address.dart';
import '../screens/account_screen/Address/view/savedAddress.dart';
import '../screens/account_screen/view/edit_profile_view.dart';
import '../screens/cart_screen/view/cart.dart';
import '../screens/homescreens/categories_productView/view/productview.dart';
import '../screens/homescreens/home_screen/bindings/homescreenBinding.dart';
import '../screens/homescreens/home_screen/view/homescreen.dart';
import '../screens/homescreens/homescreen_details/view/poduct_detals.dart';
import '../screens/homescreens/sort_screen/sort_view/sort_view.dart';
import '../screens/homescreens/view_all_products/view/view_all_products.dart';
import '../screens/orderdItem/view/ordereditem.dart';
import '../screens/wishlist/wishlist.dart';

class Routes {
  static String splashscreen = '/splash';
  static String bottomnav = '/bottom';
  static String homescreen = '/home_screen';
  static String browse_categories_productView = '/browse_categories_productView';
  static String searchscreen = '/searchscreen';
  static String homescreenProduvt = '/homescreenProduvt';
  static String productsDetails = '/productdetails';
  static String categories = '/categories';
  static String orderConfirm = '/orderConfirm';
  static String viewAllProducts = '/viewAllProducts';
  static String wishlist = '/wishlist';
  static String addressScreen = '/addressScreen';
  static String reviews = '/reviews';
  static String cart = '/cart';
  static String wallet = '/wallet';
  static String confirmOrder = '/confirmOrder';
  static String savedAddress = '/savedAddress';
  static String sortscreen = '/sortscreen';
  static String editProfile = '/editProfile';
  static String editAddress = '/editAddress';




  static List<GetPage> pages = [
    GetPage(name: splashscreen, page: () => SplashScreen()),  // Changed this line
    GetPage(name: bottomnav, page: () => BottomNavigationWidget()),
    GetPage(name: homescreen, page: () => HomeScreen(),binding: HomescreenBinding()),
    GetPage(name: browse_categories_productView, page: () => BrowseCategoriesproductView()),
    GetPage(name: searchscreen, page: () => SearchScreen(), binding: SearchBinding()),
     GetPage(name: productsDetails, page: () => ProductsDetails()),
    GetPage(name: categories, page: ()=>CategoryScreen()),
    GetPage(name: orderConfirm, page: ()=>OrderItem()),
    GetPage(name: viewAllProducts, page: ()=>ViewAllProducts()),
    GetPage(name: wishlist, page: ()=>WishList()),
    GetPage(name: addressScreen, page: ()=>AddressScreen()),
    GetPage(name: reviews, page: ()=>Reviews()),
    GetPage(name: cart, page: ()=>CartScreen()),
    GetPage(name: wallet, page: ()=>WalletScreen()),
    GetPage(name: confirmOrder, page: ()=>ConfirmOrder()),
    GetPage(name: savedAddress, page: ()=>SavedAddress()),
    GetPage(name: sortscreen, page: ()=>SortSCreen()),
    GetPage(name: editProfile, page: ()=>EditProfile()),
    GetPage(name: editAddress, page: ()=>AddressEditScreen()),


  ];
}
