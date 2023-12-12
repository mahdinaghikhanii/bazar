import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;

import '../../common/constans/constans.dart';

class ApiClient {
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final int timeoutInSeconds = 30;

  String? token;
  late Map<String, String> _mainHeaders;

  ApiClient() {
    updateHeader(token);
  }

  Map<String, String> updateHeader(String? token, {bool setHeader = true}) {
    Map<String, String> header = {};

    header.addAll({'Content-Type': 'application/json; charset=UTF-8'});

    if (setHeader) {
      _mainHeaders = header;
    }
    return header;
  }

  Future<Response> getData(String uri, {Map<String, dynamic>? quer}) async {
    Map<String, String> header = {};

    header.addAll({'Content-Type': 'application/json; charset=UTF-8'});

    try {
      if (kDebugMode) {
        print('====> API Call: $uri  \nHeader: $_mainHeaders');
      }
      http.Response response = await http
          .get(
            Uri.parse(AppConstants.baseURL + uri)
                .replace(queryParameters: quer),
            headers: header ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));

      return handleResponse(response, uri);
    } catch (e) {
      if (kDebugMode) {
        print('------------${e.toString()}');
      }
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postData(String uri, dynamic body, {int? timeout}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Body: $body');
      }
      http.Response response = await http
          .post(
            Uri.parse(AppConstants.baseURL + uri),
            body: jsonEncode(body),
            headers: _mainHeaders,
          )
          .timeout(Duration(seconds: timeout ?? timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      debugPrint("========> Error : $e");
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> putData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Body: $body');
      }
      http.Response response = await http
          .put(
            Uri.parse(AppConstants.baseURL + uri),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> deleteData(String uri,
      {Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
      }
      http.Response response = await http
          .delete(
            Uri.parse(AppConstants.baseURL + uri),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Response handleResponse(http.Response response, String uri) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (_) {}
    Response response0 = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      request: Request(
          headers: response.request!.headers,
          method: response.request!.method,
          url: response.request!.url),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (response0.statusCode != 200 &&
        response0.body != null &&
        response0.body is! String) {
      if (response0.body.toString().startsWith('{errors: [{code:')) {
        // ErrorResponse errorResponse = ErrorResponse.fromJson(response0.body);
        // response0 = Response(statusCode: response0.statusCode, body: response0.body, statusText: errorResponse.errors![0].message);
      } else if (response0.body.toString().startsWith('{message')) {
        response0 = Response(
            statusCode: response0.statusCode,
            body: response0.body,
            statusText: response0.body['message']);
      }
    } else if (response0.statusCode != 200 && response0.body == null) {
      response0 = Response(statusCode: 0, statusText: noInternetMessage);
    }
    return response0;
  }
}
