import 'package:testt/src/features/auth/signup/model/send_email_otp.dart';

abstract class AuthRepository {
  // Sign up with phone
  Future<Map<String, dynamic>> sendPhoneOtp(dynamic data);
  Future<Map<String, dynamic>> verifyPhoneOtp(dynamic data);

  // Sign up with email
  Future<SendEmailOtpResponse> sendEmailOtp(dynamic data);
  Future<Map<String, dynamic>> reSendEmailOtp(dynamic data);
  Future<Map<String, dynamic>> verifyEmailOtp(dynamic data);

  // Profile setup
  Future<Map<String, dynamic>> selectAccountMode(dynamic data);
  Future<Map<String, dynamic>> completeProfile(dynamic data);
}
