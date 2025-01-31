import 'dart:io';
import 'package:testt/src/model/account_verfication/account_verification_model.dart';
import 'package:testt/src/model/user/user_model.dart';
import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_services.dart';
import '../../data/network/app_url.dart';
import 'profile_repository.dart';

class ProfileHttpApiRepository implements ProfileRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<UserModel> fetchMyProfile() async {
    try {
      final response = await _apiServices.fetchGetApiResponse(AppUrl.myprofile);

      // Ensure response is properly decoded
      final Map<String, dynamic> responseData = response;

      // Extract "user" data and parse it into UserModel
      if (responseData.containsKey('data') &&
          responseData['data'].containsKey('user')) {
        return UserModel(user: User.fromJson(responseData['data']['user']));
      } else {
        throw Exception("Invalid response format: Missing 'user' field.");
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<dynamic> editProfile(dynamic data, {File? profileImage}) async {
    try {
      final response = await _apiServices.postMediaApiResponse(
        AppUrl.editprofile,
        data,
        singleFile: profileImage,
        mediaFieldName: 'profileImage',
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<AccountVerificationModel> checkVerification() async {
    try {
      final response =
          await _apiServices.fetchGetApiResponse(AppUrl.checkVerification);
      return AccountVerificationModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future shopVerification(data,
      {File? idCardFrontImage, File? idCardBackImage, File? shopImage}) async {
    try {
      final response = await _apiServices.postMediaApiResponse(
        AppUrl.verifyShopAccount,
        data,
        mediaFiles: [idCardFrontImage!, idCardBackImage!, shopImage!],
        mediaFieldNames: ['idCardFrontImage', 'idCardBackImage', 'shopImage'],
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future individualVerification(data,
      {File? idCardFrontImage, File? idCardBackImage}) async {
    try {
      final response = await _apiServices.postMediaApiResponse(
        AppUrl.verifyIndividualAccount,
        data,
        mediaFiles: [idCardFrontImage!, idCardBackImage!],
        mediaFieldNames: ['idCardFrontImage', 'idCardBackImage'],
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
