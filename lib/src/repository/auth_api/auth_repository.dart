import '../../model/user/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> continueWithPhoneNumberApi(dynamic data);
  Future<UserModel> verifyOtpApi(dynamic data);
  Future<UserModel> signInWithEmailApi(dynamic data);
  Future<UserModel> signUpWithEmailApi(dynamic data);
  
  
  
  Future<UserModel> continueWithGoogleApi(dynamic data);
  Future<UserModel> forgotPasswordApi(dynamic data);
  Future<UserModel> resetPasswordApi(dynamic data);

  Future<UserModel> createAccountAsShop(dynamic data);
  Future<UserModel> verifyVendorIdenity(dynamic data);
  Future<UserModel> forgotPassword(dynamic data);
  Future<UserModel> verifyForgotpasswordOtp(dynamic data);
  Future<UserModel> resstPasswordOtp(dynamic data);
  Future<UserModel> updatePasswordOtp(dynamic data);
}
