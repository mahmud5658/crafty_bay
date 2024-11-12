import 'dart:convert';

import 'package:crafty_bay/data/models/network_response.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      final Response response = await get(uri, headers: {'token': ''});
      if (response.statusCode == 200) {
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodedBody);
      } else {
        return NetworkResponse(
            statusCode: response.statusCode, isSuccess: false);
      }
    } catch (e) {
      return NetworkResponse(
          statusCode: -1, isSuccess: false, errorMessage: e.toString());
    }
  }
  Future<NetworkResponse> postRequest({required String url,Map<String,dynamic>?body}) async {
    try {
      Uri uri = Uri.parse(url);
      final Response response = await post(uri, headers: {'token': '','content-type:':'application/json'},body: jsonEncode(body));
      if (response.statusCode == 200) {
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodedBody);
      } else {
        return NetworkResponse(
            statusCode: response.statusCode, isSuccess: false);
      }
    } catch (e) {
      return NetworkResponse(
          statusCode: -1, isSuccess: false, errorMessage: e.toString());
    }
  }
}
