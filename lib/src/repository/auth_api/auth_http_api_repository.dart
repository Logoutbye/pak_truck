import 'dart:convert';

import 'package:testt/src/features/auth/model/send_email_otp.dart';

import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_services.dart';
import '../../model/user/user_model.dart';
import '../../configs/app_url.dart';
import 'auth_repository.dart';

class AuthHttpApiRepository implements AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<SendEmailOtpResponse> sendEmailOtp(dynamic data) async {
    print('Sending OTP request...');
    dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.sendEmailOtp, jsonEncode(data));
    return SendEmailOtpResponse.fromJson(response);
  }

  @override
  Future<UserModel> continueWithGoogleApi(data) {
    // TODO: implement continueWithGoogleApi
    throw UnimplementedError();
  }

  @override
  Future<UserModel> continueWithPhoneNumberApi(data) {
    // TODO: implement continueWithPhoneNumberApi
    throw UnimplementedError();
  }

  @override
  Future<UserModel> createAccountAsShop(data) {
    // TODO: implement createAccountAsShop
    throw UnimplementedError();
  }

  @override
  Future<UserModel> forgotPassword(data) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> forgotPasswordApi(data) {
    // TODO: implement forgotPasswordApi
    throw UnimplementedError();
  }

  @override
  Future<UserModel> resetPasswordApi(data) {
    // TODO: implement resetPasswordApi
    throw UnimplementedError();
  }

  @override
  Future<UserModel> resstPasswordOtp(data) {
    // TODO: implement resstPasswordOtp
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signInWithEmailApi(data) {
    // TODO: implement signInWithEmailApi
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithEmailApi(data) {
    // TODO: implement signUpWithEmailApi
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updatePasswordOtp(data) {
    // TODO: implement updatePasswordOtp
    throw UnimplementedError();
  }

  @override
  Future<UserModel> verifyForgotpasswordOtp(data) {
    // TODO: implement verifyForgotpasswordOtp
    throw UnimplementedError();
  }

  @override
  Future<UserModel> verifyOtpApi(data) {
    // TODO: implement verifyOtpApi
    throw UnimplementedError();
  }

  @override
  Future<UserModel> verifyVendorIdenity(data) {
    // TODO: implement verifyVendorIdenity
    throw UnimplementedError();
  }
}
