import 'package:flutter/material.dart';
import 'package:testt/src/data/response/api_response.dart';
import 'package:testt/src/model/account_verfication/account_verification_model.dart';
import 'package:testt/src/model/user/user_model.dart';
import 'package:testt/src/repository/profile_api/profile_repository.dart';

class ProfileViewModel with ChangeNotifier {
  final ProfileRepository profileRepository;

  ProfileViewModel({required this.profileRepository});

  ApiResponse<UserModel> myProfile = ApiResponse.notStarted();

  setProfile(ApiResponse<UserModel> response) {
    myProfile = response;
    notifyListeners();
  }

  Future<void> fetchMyProfileApi() async {

    setProfile(ApiResponse.loading());

    profileRepository.fetchMyProfile().then((value) {

      setProfile(ApiResponse.completed(value));

    }).onError((error, stackTrace) {

      setProfile(ApiResponse.error(error.toString()));
      
    });
  }

  ApiResponse<AccountVerificationModel> verificationStatus =
      ApiResponse.notStarted();

  setVerificationStatus(ApiResponse<AccountVerificationModel> response) {
    verificationStatus = response;
    notifyListeners();
  }

  Future<void> checkVerificationApi() async {
    setVerificationStatus(ApiResponse.loading());
    try {
      final response = await profileRepository.checkVerification();
      setVerificationStatus(ApiResponse.completed(response));
    } catch (error) {
      setVerificationStatus(ApiResponse.error(error.toString()));
    }
  }
}
