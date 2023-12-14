


import 'dart:convert';

import 'package:http/http.dart' as http;


class APIClass{



 Future<Map<String, dynamic>> fetchPrice() async {
    final response = await  http.get(Uri.parse('https://api.coingecko.com/api/v3/coins/usd'));

    if (response.statusCode == 200) {



      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

