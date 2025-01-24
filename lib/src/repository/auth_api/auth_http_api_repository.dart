import 'dart:convert';
import 'package:testt/src/features/auth/signup/model/send_email_otp.dart';
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
  Future<SendEmailOtpResponse> sendEmailOtp(dynamic data) async {
    dynamic response = await _apiServices.postApiResponse(
        AppUrl.sendEmailOtp, jsonEncode(data));
    return SendEmailOtpResponse.fromJson(response);
  }

  @override
  Future<Map<String, dynamic>> verifyEmailOtp(dynamic data) async {
    try {
      final response = await _apiServices.postApiResponse(
          AppUrl.verifyEmailOtp, jsonEncode(data));
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> reSendEmailOtp(dynamic data) async {
    try {
      final response = await _apiServices.postApiResponse(
          AppUrl.reSendEmailOtp, jsonEncode(data));
      return response;
    } catch (error) {
      rethrow;
    }
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
}
