import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:testt/src/configs/my_logger.dart';
import 'package:testt/src/data/app_exceptions.dart';
import 'package:testt/src/features/splash/services/session_manager/session_controller.dart';

import 'base_api_services.dart';

class NetworkApiService implements BaseApiServices {
  @override
  Future fetchGetApiResponse(String url) async {
    MyLogger.debug('request url: $url');

    dynamic responseJson;
    try {
      // Retrieve the token from SessionController
      String? token = SessionController().token;

      // Prepare headers
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      // Add Authorization header if token is available
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      // Log headers for debugging
      MyLogger.debug('Request Headers: $headers');

      // Make the GET request with headers
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    return responseJson;
  }

  @override
  Future postApiResponse(String url, dynamic data) async {
    MyLogger.debug('request url: $url');
    MyLogger.debug('request body: $data');
    dynamic responseJson;
    try {
      // Retrieve the token from SessionController
      String? token = SessionController().token;

      // Prepare headers, conditionally adding the Authorization header
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      // Log headers for debugging
      MyLogger.debug('Request Headers: $headers');

      // Make the POST request
      Response response = await post(
        Uri.parse(url),
        headers: headers,
        body: data,
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    return responseJson;
  }

  /// Post request with support for single or multiple media files (images, videos, etc.)
@override
Future<dynamic> postMediaApiResponse(
  String url,
  dynamic data, {
  File? singleFile, // ✅ Single file
  List<File>? mediaFiles, // ✅ Multiple files
  String? mediaFieldName, // ✅ Field name for single file
  List<String>? mediaFieldNames, // ✅ Field names for multiple files
  List<String>? allowedFileTypes, // ✅ Allowed file types
}) async {
  MyLogger.debug('request url: $url');
  MyLogger.debug('request body: $data');
  MyLogger.debug('request mediaField: $mediaFieldName');
  MyLogger.debug('request singleFile: $singleFile');
  MyLogger.debug('request mediaFiles: $mediaFiles');
  MyLogger.debug('request mediaFieldNames: $mediaFieldNames');

  dynamic responseJson;

  try {
    // ✅ Retrieve the token from SessionController
    String? token = SessionController().token;

    // ✅ Create Multipart Request
    var request = MultipartRequest('POST', Uri.parse(url));

    // ✅ Prepare headers
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    request.headers.addAll(headers);

    // ✅ Log headers for debugging
    MyLogger.debug('Request Headers: $headers');

    // ✅ Add form fields
    data.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    // ✅ Handle single file upload
    if (singleFile != null) {
      final fileExtension = singleFile.path.split('.').last.toLowerCase();
      if (allowedFileTypes != null &&
          !allowedFileTypes.contains(fileExtension)) {
        throw Exception(
            'Unsupported file type: $fileExtension. Allowed types: ${allowedFileTypes.join(', ')}');
      }

      var stream = ByteStream(singleFile.openRead());
      var length = await singleFile.length();
      var multipartFile = MultipartFile(
        mediaFieldName ?? 'file', // ✅ Use mediaFieldName or default to 'file'
        stream,
        length,
        filename: singleFile.path.split('/').last,
      );
      request.files.add(multipartFile);
    }

    // ✅ Handle multiple file uploads dynamically
    if (mediaFiles != null && mediaFiles.isNotEmpty && mediaFieldNames != null) {
      if (mediaFiles.length != mediaFieldNames.length) {
        throw Exception('Number of files and field names must match');
      }

      for (int i = 0; i < mediaFiles.length; i++) {
        final file = mediaFiles[i];
        final fieldName = mediaFieldNames[i]; // ✅ Use dynamic field name

        final fileExtension = file.path.split('.').last.toLowerCase();
        if (allowedFileTypes != null &&
            !allowedFileTypes.contains(fileExtension)) {
          throw Exception(
              'Unsupported file type: $fileExtension. Allowed types: ${allowedFileTypes.join(', ')}');
        }

        var stream = ByteStream(file.openRead());
        var length = await file.length();
        var multipartFile = MultipartFile(
          fieldName, // ✅ Use dynamic field name
          stream,
          length,
          filename: file.path.split('/').last,
        );
        request.files.add(multipartFile);
      }
    }

    // ✅ Send Request
    var streamedResponse = await request.send();
    var response = await Response.fromStream(streamedResponse);
    responseJson = returnResponse(response);
  } on SocketException {
    throw Exception('No Internet Connection');
  } on TimeoutException {
    throw Exception('Request timed out');
  } catch (e) {
    throw Exception('An error occurred: $e');
  }
  return responseJson;
}

  @override
  Future<dynamic> deleteApiResponse(String url, {dynamic data}) async {
    MyLogger.debug('request url: $url');
    MyLogger.debug('request body: $data');
    dynamic responseJson;
    try {
      // Retrieve the token from SessionController
      String? token = SessionController().token;

      // Prepare headers, conditionally adding the Authorization header
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      // Log headers for debugging
      MyLogger.debug('Request Headers: $headers');

      // Make the POST request
      Response response = await delete(
        Uri.parse(url),
        headers: headers,
        body: data,
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    return responseJson;
  }

  @override
  Future putApiResponse(String url, dynamic data) async {
    MyLogger.debug('request url: $url');
    MyLogger.debug('request body: $data');
    dynamic responseJson;
    try {
      // Retrieve the token from SessionController
      String? token = SessionController().token;

      // Prepare headers, conditionally adding the Authorization header
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      // Log headers for debugging
      MyLogger.debug('Request Headers: $headers');

      // Make the POST request
      Response response = await put(
        Uri.parse(url),
        headers: headers,
        body: data,
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    MyLogger.info('response.statusCode ${response.statusCode}');
    MyLogger.info('response.body ${response.body}');

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        throw BadRequestException(
            responseJson['message'] ?? 'Bad request occurred.');
      case 500:
        dynamic responseJson = jsonDecode(response.body);
        throw BadRequestException(
            responseJson['message'] ?? 'Bad request occurred.');
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        throw UnauthorisedException(
            responseJson['message'] ?? 'Bad request occurred.');
      default:
        throw FetchDataException(
            'Error occured while communicating with server');
    }
  }
}
