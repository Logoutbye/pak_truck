
abstract class AuthRepository {
  // Sign up with phone
  Future<Map<String, dynamic>> sendPhoneOtp(dynamic data);
  Future<Map<String, dynamic>> verifyPhoneOtp(dynamic data);

  // Sign up with email
  Future<Map<String, dynamic>> signupEmail(dynamic data);
  Future<Map<String, dynamic>> signInEmail(dynamic data);


  // Profile setup
  Future<Map<String, dynamic>> selectAccountMode(dynamic data);
  Future<Map<String, dynamic>> completeProfile(dynamic data);
  Future<Map<String, dynamic>> forgotPasswordApi(dynamic data);
  Future<Map<String, dynamic>> resetPasswordApi(dynamic data);
}
