
import 'package:http/http.dart' as http;

import '../../Utils/Constant.dart';
import 'ApiClient.dart';

class AuthRepo {
  final ApiClient api = ApiClient();
  //for minati Login
  Future<http.Response> Login(Map<String, String> body) async {
    return api.getData(AppContant.Login, false, body);
  }

  Future<http.Response> Register(Map<String, String> body) async {
    return api.postData(AppContant.Register, body);
  }

  Future<http.Response> Transactions(Map<String, String> body) async {
    return api.getData(AppContant.transactions, false, body);
  }

  Future<http.Response> OTP(Map<String, String> body) async {
    return api.postData(AppContant.getotp, body);
  }

  Future<http.Response> TransferFund(Map<String, String> body) async {
    return api.postData(AppContant.transferfunds, body);
  }

  Future<http.Response> Search(Map<String, String> body) async {
    return api.getData(AppContant.finduser, false, body);
  }
}
