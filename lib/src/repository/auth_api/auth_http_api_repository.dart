import 'dart:convert';

import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_services.dart';
import '../../data/network/app_url.dart';
import 'auth_repository.dart';

class AuthHttpApiRepository implements AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  // Signup with phone
  @override
  Future<Map<String, dynamic>> sendPhoneOtp(dynamic data) async {
    try {
      final response = await _apiServices.postApiResponse(
          AppUrl.sendPhoneOtp, jsonEncode(data));
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> verifyPhoneOtp(dynamic data) async {
    try {
      final response = await _apiServices.postApiResponse(
          AppUrl.verifyPhoneOtp, jsonEncode(data));
      return response;
    } catch (error) {
      rethrow;
    }
  }

  // signup with email
  @override
  Future<Map<String, dynamic>> signupEmail(dynamic data) async {
    dynamic response = await _apiServices.postApiResponse(
        AppUrl.signupEmail, jsonEncode(data));
    return response;
  }

  @override
  Future<Map<String, dynamic>> signInEmail(dynamic data) async {
    dynamic response = await _apiServices.postApiResponse(
        AppUrl.signInEmail, jsonEncode(data));
    return response;
  }

  // Profile setup
  @override
  Future<Map<String, dynamic>> selectAccountMode(dynamic data) async {
    try {
      final response = await _apiServices.postApiResponse(
          AppUrl.selectAccountMode, jsonEncode(data));
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> completeProfile(dynamic data) async {
    try {
      final response = await _apiServices.postApiResponse(
          AppUrl.completeProfile, jsonEncode(data));
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> forgotPasswordApi(dynamic data) async {
    try {
      final response = await _apiServices.postApiResponse(
          AppUrl.forgetPassword, jsonEncode(data));
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> resetPasswordApi(dynamic data) async {
    try {
      final response = await _apiServices.postApiResponse(
          AppUrl.resetPassword, jsonEncode(data));
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
