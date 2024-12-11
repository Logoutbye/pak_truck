import '../../model/user/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> loginApi(dynamic data);
  Future<UserModel> continueWithPhoneNumberApi(dynamic data);
  Future<UserModel> verifyOtpApi(dynamic data);
  Future<UserModel> continueWithEmailApi(dynamic data);
  Future<UserModel> continueWithGoogleApi(dynamic data);
  Future<UserModel> resetPasswordApi(dynamic data);
  Future<UserModel> forgotPasswordApi(dynamic data);

  Future<UserModel> createAccountAsShop(dynamic data);
  Future<UserModel> verifyVendorIdenity(dynamic data);
}
