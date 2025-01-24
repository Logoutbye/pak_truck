class AppUrl {
  // static var baseUrl = 'https://paktruck-production.up.railway.app/api';

  static const baseUrl = "http://192.168.18.132:8000/api";

  static var sendPhoneOtp = '$baseUrl/auth/app/otp/send'; // done
  static var verifyPhoneOtp = '$baseUrl/auth/app/otp/verify'; // done

  static var reSendPhoneOtp = '$baseUrl/auth/app/otp/send';

  static var sendEmailOtp = '$baseUrl/api/auth/app/otp/send';
  static var verifyEmailOtp = '$baseUrl/auth/app/otp/send';
  static var reSendEmailOtp = '$baseUrl/auth/send-otp';

  static var selectAccountMode = '$baseUrl/auth/app/account-mode/select';
  static var completeProfile = '$baseUrl/auth/send-otp';
}
