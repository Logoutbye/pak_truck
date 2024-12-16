import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:testt/src/features/splash/services/session_manager/session_controller.dart';
import '../app_exceptions.dart';
import 'base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiService implements BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      String? token = SessionController().token;

      var headers = token != null
          ? {'Content-Type': 'application/json', 'Authorization': token}
          : {'Content-Type': 'application/json'};

      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      String? token = SessionController().token;

      var headers = token != null
          ? {'Content-Type': 'application/json', 'Authorization': token}
          : {'Content-Type': 'application/json'};

      Response response =
          await post(Uri.parse(url), headers: headers, body: data)
              .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server');
    }
  }

  @override
  Future getDeleteApiResponse(String url) {
    // TODO: implement getDeleteApiResponse
    throw UnimplementedError();
  }

  @override
  Future getPatchApiResponse(String url, data) {
    // TODO: implement getPatchApiResponse
    throw UnimplementedError();
  }
}
