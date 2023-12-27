


import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Utils/API.dart';


class APIClass{


 Future<Map<String, dynamic>>  fetchcoindata(String urrl) async {
    final response = await http.get(Uri.parse(urrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }








Future<Map<String, dynamic>> getAccountInfo() async {
  try {
    var uri = Uri.parse(Api.SHASTA + Api.getAsset+Api.walletadddresTron);
    var response = await http.get(
      uri,
      headers: {"Content-Type": "application/json"},
      // body: jsonEncode({
      //   "address": "TZ4UXDV5ZhNW7fb2AMSbgfAEZ7hWsnYS2g",
      //   //ConstantClass.wallet.toString(),
      //   "visible": true,
      // }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      print('Failed to load account info. Error ${response.statusCode}');
      // Handle the error as needed, e.g., throw an exception
      throw Exception('Failed to load account info. Error ${response.statusCode}');
    }
  } catch (e) {
    print('Exception while fetching account info: $e');
    // Handle the exception as needed, e.g., throw an exception
    throw Exception('Exception while fetching account info: $e');
  }
}




}
