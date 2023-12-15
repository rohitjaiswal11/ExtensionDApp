


import 'dart:convert';

import 'package:http/http.dart' as http;


class APIClass{


 Future<Map<String, dynamic>> fetchcoindata(String urrl) async {
    final response = await http.get(Uri.parse(urrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

