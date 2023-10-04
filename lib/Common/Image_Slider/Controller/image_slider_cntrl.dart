import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Api/api_call.dart';
import '../Api/imageslider_model.dart';

class BannerController extends GetxController {
  var isLoading = true.obs;
  var bannerImages = BannerImages().obs;
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }
  void onImageTapped(String link) async {
    Uri uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('Could not launch $uri');
    }
  }
  Future<void> fetchImages() async {
    try {
      isLoading(true);
      var api = BannerApi();
      var images = await api.fetchBannerImages();
      bannerImages(images);
    } catch (error) {
      print('Error: $error');
    } finally {
      isLoading(false);
    }
  }
}
