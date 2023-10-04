import 'dart:convert';
import 'package:cybzone_neoline/screens/account_screen/Apicall/profile_modelclass.dart';
import 'package:http/http.dart' as http;

class ProfileApi {
  Future<Profile> getProfile(String customerId) async {
    final url = 'https://ecom.laurelss.com/Api/my_dashboard?customer_id=$customerId';
    print('getProfile: Fetching profile from URL - $url');

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      print('getProfile: Profile data fetched successfully');
      return Profile.fromJson(jsonMap);
    } else {
      print('getProfile: Failed to load profile. Status code: ${response.statusCode}');
      throw Exception('Failed to load profile');
    }
  }
}
