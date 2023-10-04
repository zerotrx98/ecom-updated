// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// Future<void> postData({
//   required String name,
//   required String lastname,
//   required String phone,
//   required String customer_id,
//   required String address,
//   required String city,
//   required String landmark,
//   required String country,
//   required String pincode,
// }) async {
//   final url = 'your_api_url_here'; // Replace with your actual API URL
//
//   final response = await http.post(
//     Uri.parse(url),
//     body: {
//       'name': name,
//       'lastname': lastname,
//       'phone': phone,
//       'customer_id': customer_id,
//       'customer_address': address,
//       'customer_city': city,
//       'customer_landmark': landmark,
//       'country': country,
//       'pincode': pincode,
//     },
//   );
//
//   if (response.statusCode == 200) {
//     // Successful API call
//     final responseData = json.decode(response.body);
//     if (responseData['status'] == 1 && responseData['data'] == 'Address Added') {
//       print('API call successful');
//       print('Response: ${response.body}');
//       // Do something with the success response
//     } else {
//       print('API call failed: ${responseData['data']}');
//     }
//   } else {
//     // API call failed
//     print('API call failed with status ${response.statusCode}');
//     print('Response: ${response.body}');
//   }
// }
