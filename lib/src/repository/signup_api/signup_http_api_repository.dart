import 'dart:convert';
import 'package:testt/src/features/auth/signup/model/send_email_otp.dart';
import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_services.dart';
import '../../configs/app_url.dart';
import 'signup_repository.dart';

class SignUpHttpApiRepository implements SignUpRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  // signup with email
  @override
  Future<SendEmailOtpResponse> sendEmailOtp(dynamic data) async {
    dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.sendEmailOtp, jsonEncode(data));
    return SendEmailOtpResponse.fromJson(response);
  }

  @override
  Future<Map<String, dynamic>> reSendEmailOtp(dynamic data) async {
    try {
      final response = await _apiServices.getPostApiResponse(
          AppUrl.reSendEmailOtp, jsonEncode(data));
      return jsonDecode(response);
    } catch (error) {
      throw Exception("Failed to resend email OTP: $error");
    }
  }

  @override
  Future<Map<String, dynamic>> verifyEmailOtp(dynamic data) async {
    try {
      final response = await _apiServices.getPostApiResponse(
          AppUrl.verifyEmailOtp, jsonEncode(data));
      return jsonDecode(response);
    } catch (error) {
      throw Exception("Failed to verify email OTP: $error");
    }
  }

  // Signup with phone
  @override
  Future<Map<String, dynamic>> sendPhoneOtp(dynamic data) async {
    try {
      final response = await _apiServices.getPostApiResponse(
          AppUrl.sendPhoneOtp, jsonEncode(data));
      return jsonDecode(response);
    } catch (error) {
      throw Exception("Failed to send phone OTP: $error");
    }
  }

  @override
  Future<Map<String, dynamic>> reSendPhoneOtp(dynamic data) async {
    try {
      final response = await _apiServices.getPostApiResponse(
          AppUrl.reSendPhoneOtp, jsonEncode(data));
      return jsonDecode(response);
    } catch (error) {
      throw Exception("Failed to resend phone OTP: $error");
    }
  }

  @override
  Future<Map<String, dynamic>> verifyPhoneOtp(dynamic data) async {
    try {
      final response = await _apiServices.getPostApiResponse(
          AppUrl.verifyPhoneOtp, jsonEncode(data));
      return jsonDecode(response);
    } catch (error) {
      throw Exception("Failed to verify phone OTP: $error");
    }
  }
 
  // Profile setup
  @override
  Future<Map<String, dynamic>> selectAccountMode(dynamic data) async {
    try {
      final response = await _apiServices.getPostApiResponse(
          AppUrl.selectAccountMode, jsonEncode(data));
      return jsonDecode(response);
    } catch (error) {
      throw Exception("Failed to select account mode: $error");
    }
  }

  @override
  Future<Map<String, dynamic>> completeProfile(dynamic data) async {
    try {
      final response = await _apiServices.getPostApiResponse(
          AppUrl.completeProfile, jsonEncode(data));
      return jsonDecode(response);
    } catch (error) {
      throw Exception("Failed to complete profile: $error");
    }
  }
}
