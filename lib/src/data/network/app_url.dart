class AppUrl {
  static var baseUrl = 'https://paktruck-production.up.railway.app/api';

  // static const baseUrl = "http://192.168.18.102:3000/api";

  static var sendPhoneOtp = '$baseUrl/auth/app/otp/send';
  static var reSendPhoneOtp = '$baseUrl/auth/app/otp/send';
  static var verifyEmailOtp = '$baseUrl/auth/app/otp/send';

  static var sendEmailOtp = '$baseUrl/auth/send-otp';
  static var reSendEmailOtp = '$baseUrl/auth/send-otp';
  static var verifyPhoneOtp = '$baseUrl/auth/send-otp';

  static var selectAccountMode = '$baseUrl/auth/send-otp';
  static var completeProfile = '$baseUrl/auth/send-otp';
}
