import 'package:flutter/material.dart';
import 'package:testt/src/data/response/api_response.dart';
import 'package:testt/src/model/user/user_model.dart';
import 'package:testt/src/repository/profile_api/profile_repository.dart';

class ProfileViewModel with ChangeNotifier {
  final ProfileRepository profileRepository;

  ProfileViewModel({required this.profileRepository});

  ApiResponse<UserModel> myProfile = ApiResponse.notStarted();

  setProfile(ApiResponse<UserModel> response) {
    myProfile = response;
    print(response);
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
}
