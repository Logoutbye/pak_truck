import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_services.dart';
import '../../model/user/user_model.dart';
import '../../configs/app_url.dart';
import 'auth_repository.dart';

class AuthHttpApiRepository implements AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<UserModel> loginApi(dynamic data) async {
    dynamic response =
        await _apiServices.getPostApiResponse(AppUrl.loginEndPint, data);
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> continueWithEmailApi(data) {
    // TODO: implement continueWithEmailApi
    throw UnimplementedError();
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
