import 'dart:convert';

import 'package:crafty_bay/data/models/network_response.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkCaller {
  final Logger logger;
  NetworkCaller({required this.logger});
  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      _requestLog(url, {}, {}, '');
      final Response response = await get(uri, headers: {'token': ''});
      if (response.statusCode == 200) {
        _responseLog(
            url, response.statusCode, response.body, response.headers, true);
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodedBody);
      } else {
        _responseLog(
            url, response.statusCode, response.body, response.headers, false);
        return NetworkResponse(
            statusCode: response.statusCode, isSuccess: false);
      }
    } catch (e) {
      _responseLog(url, -1, e, {}, false, e);
      return NetworkResponse(
          statusCode: -1, isSuccess: false, errorMessage: e.toString());
    }
  }

  Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      _requestLog(url, {}, body ?? {}, '');
      final Response response = await post(uri,
          headers: {'token': '', 'content-type:': 'application/json'},
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        _responseLog(
            url, response.statusCode, response.body, response.headers, true);
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodedBody);
      } else {
        _responseLog(
            url, response.statusCode, response.body, response.headers, false);
        return NetworkResponse(
            statusCode: response.statusCode, isSuccess: false);
      }
    } catch (e) {
      _responseLog(url, -1, e, {}, false, e);
      return NetworkResponse(
          statusCode: -1, isSuccess: false, errorMessage: e.toString());
    }
  }

  void _requestLog(String url, Map<String, dynamic> params,
      Map<String, dynamic> body, String token) {
    logger.i('''
    url: $url,
    params: $params,
    body: $body,
    token: $token
    ''');
  }

  void _responseLog(String url, int statusCode, dynamic responseBody,
      Map<String, dynamic> headers, bool isSuccess,
      [dynamic error]) {
    String message = '''
    url : $url,
    statusCode : $statusCode,
    headers: $headers,
    response body: $responseBody,
    error: $error
    ''';
    if (isSuccess) {
      logger.i(message);
    } else {
      logger.e(message);
    }
  }
}
