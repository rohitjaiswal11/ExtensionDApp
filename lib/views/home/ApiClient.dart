import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:image_picker/image_picker.dart';

import '../../Utils/Constant.dart';
import '../../Utils/logger.dart';

class ApiClient {
  final int timeoutInSeconds = 15;
  Map<String, String> _mainHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  final String appBaseUrl = AppContant.Baseurl;
  static final String noInternetMessage =
      'Connection to API server failed due to internet connection';

  Future<http.Response> getData(String uri, bool header, dynamic bdy) async {
    http.Response _response;
    try {
      if (header) {
        await updateHeader();
      }
      final URI;
      if (bdy.toString().isEmpty) {
        URI = Uri.http(appBaseUrl, uri);
      } else {
        URI = Uri.http(appBaseUrl, uri, bdy);
      }

      ///for local url
      //final URI = Uri.http(appBaseUrl, uri);
      Logger.logprint('====> API Call:' + URI.toString());

      _response = await http
          .get(URI, headers: _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      Logger.logprint(_response.body);
    } catch (e) {
      print("catech" + e.toString());
      final res = {
        "message": e.toString(),
      };
      _response = http.Response(jsonEncode(res), 400);
    }
    return _response;
  }

  Future<http.Response> postData(
    String uri,
    dynamic body,
  ) async {
    http.Response _response;
    try {
      Logger.logprint('body -- > ' + jsonEncode(body).toString());

      final URI = Uri.http(appBaseUrl, uri);
      // final uri=Uri.parse(appBaseUrl + uri);
      Logger.logprint("login-----" + URI.toString());
      //   Logger.logprint("Header-----"+_mainHeaders.toString());

      final b1 = jsonEncode(body);
      _response = await http
          .post(URI, body: b1, headers: _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));

      Logger.logprint(_response.body);
    } catch (e) {
      print(e.toString());
      final res = {
        "message": noInternetMessage + e.toString(),
      };
      _response = http.Response(jsonEncode(res), 400);
    }
    return _response;
  }

  Future<http.Response> postMultipartData(
    String uri,
    Map<String, String> body,
    List<MultipartBody> multipartBody,
  ) async {
    http.Response _response;
    try {
      await updateHeader();

      final URI = Uri.https(appBaseUrl, uri);
      Logger.logprint(
          '====> API Body: $URI with ${multipartBody.length} files');

      http.MultipartRequest _request = http.MultipartRequest('POST', URI);

      if (multipartBody.length > 0) {
        for (MultipartBody multipart in multipartBody) {
          Uint8List _list = await multipart.file.readAsBytes();
          _request.files.add(http.MultipartFile(
            multipart.key,
            multipart.file.readAsBytes().asStream(),
            _list.length,
            filename: '${multipart.file.name.toString()}.png',
          ));
        }
      }

      _request.fields.addAll(body);
      _request.headers.addAll(_mainHeaders);
      _response = await http.Response.fromStream(await _request.send());
      Logger.logprint(_response.body);
    } catch (e) {
      final res = {
        "message": noInternetMessage + e.toString(),
      };
      _response = http.Response(jsonEncode(res), 400);
    }
    return _response;
  }

  //update header
  Future<void> updateHeader() async {
    //String? token = await SharedPreferenceClass.GetSharedData(AppContant.TOKEN);
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',

      // 'x-real-ip':"122.176.76.143",
    };
  }

  Future<http.Response> postData_Second(
    String uri,
    dynamic body,
  ) async {
    http.Response _response;
    try {
      await updateHeader();
      Logger.logprint('body -- > ' + jsonEncode(body).toString());

      final URI = Uri.parse("https://" + appBaseUrl + uri);
      // final uri=Uri.parse(appBaseUrl + uri);
      Logger.logprint("login-----" + URI.toString());
      //   Logger.logprint("Header-----"+_mainHeaders.toString());

      final b1 = jsonEncode(body);
      _response = await http
          .post(URI, body: b1, headers: _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));

      Logger.logprint(_response.body);
    } catch (e) {
      print(e.toString());
      final res = {
        "message": noInternetMessage + e.toString(),
      };
      _response = http.Response(jsonEncode(res), 400);
    }
    return _response;
  }
}

class MultipartBody {
  String key;
  XFile file;

  MultipartBody(this.key, this.file);
}

enum ApiResponse { loading, Done, Nodata, Error }
