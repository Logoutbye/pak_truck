import 'dart:io';

import 'package:testt/src/model/account_verfication/account_verification_model.dart';
import 'package:testt/src/model/user/user_model.dart';

abstract class ProfileRepository {
  // Sign up with phone
  Future<UserModel> fetchMyProfile();

  Future<dynamic> editProfile(dynamic data, {File? profileImage});

  Future<AccountVerificationModel> checkVerification();
  
  Future<dynamic> shopVerification(
    dynamic data, {
    File? idCardFrontImage,
    File? idCardBackImage,
    File? shopImage,
  });

    Future<dynamic> individualVerification(
    dynamic data, {
    File? idCardFrontImage,
    File? idCardBackImage,
  });
}
