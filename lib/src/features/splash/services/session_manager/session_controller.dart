import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../model/user/user_model.dart';
import '../storage/local_storage.dart';

// Singleton class
class SessionController {
  LocalStorage sharedPreferenceClass = LocalStorage();
  static final SessionController _session = SessionController._internal();

  bool? isLanguageSelected;
  bool? isLogin;
  UserModel? user; // User can now be null initially
  String? _token; // Cached token
  String? get token => _token;

  factory SessionController() {
    return _session;
  }

  SessionController._internal() {
    // Initialize default values
    isLogin = false;
    _token = '';
    isLanguageSelected = false;
    user = null;
  }

  // Save language preference to LocalStorage
  Future<void> saveLanguageInPreference() async {
    try {
      // Save to local storage as a string
      await sharedPreferenceClass.setValue('isLanguageSelected', 'true');

      // Update the internal state
      isLanguageSelected = true;
    } catch (e) {
      debugPrint('Error saving language preference: $e');
    }
  }

  // Get the language preference from LocalStorage
  Future<void> getIsLanguageSelectedFromPreference() async {
    try {
      // Read value from LocalStorage
      String? isLanguageSelectedString =
          await sharedPreferenceClass.readValue('isLanguageSelected');

      // Convert it to boolean (check if it's 'true')
      isLanguageSelected = isLanguageSelectedString == 'true' ? true : false;

      // If it's null or not set, default to false
      if (isLanguageSelectedString == null) {
        isLanguageSelected = false;
      }
    } catch (e) {
      debugPrint('Error retrieving language preference: $e');
    }
  }

  Future<String?> getUserToken() async {
    if (_token != null) {
      return _token; // Return cached token if already loaded
    }

    final SharedPreferences sp = await SharedPreferences.getInstance();
    _token = sp.getString('token');
    return _token;
  }

// Save the complete user data and token into shared preferences
  Future<void> saveUserInPreference(UserModel user) async {
    try {
      // Save the user object as JSON string
      String userJson = jsonEncode(user.toJson());
      await sharedPreferenceClass.setValue('user', userJson);

      // Save token as a separate key
      await sharedPreferenceClass.setValue('token', user.token);

      // Save additional login state
      await sharedPreferenceClass.setValue('isLogin', 'true');

      _token = user.token; // Cache the token locally

      // Update current session data
      this.user = user;
      this.isLogin = true;

      debugPrint("User data and token saved successfully!");
    } catch (e) {
      debugPrint('Error saving user data or token: $e');
    }
  }

  Future<void> getUserFromPreference() async {
    try {
      // Retrieve the stored JSON string
      String? userJson = await sharedPreferenceClass.readValue('user');
      String? isLoginString = await sharedPreferenceClass.readValue('isLogin');
      if (userJson != null) {
        // Parse the JSON to the UserModel
        user = UserModel.fromJson(jsonDecode(userJson));
      }

      // Update login state
      isLogin = isLoginString == 'true';
      _token = user?.token;
    } catch (e) {
      debugPrint('Error retrieving user: $e');
    }
  }

  // Clear user session
  Future<void> clearUserSession() async {
    try {
      await sharedPreferenceClass.clearValue('user');
      await sharedPreferenceClass.clearValue('isLogin');
      user = null;
      isLogin = false;
    } catch (e) {
      debugPrint('Error clearing user session: $e');
    }
  }

  dynamic getUserField(String fieldName) {
    if (user != null && user!.user != null) {
      // Access the nested 'user' field and convert it to a Map
      var userMap = user!.user!.toJson();
      print('::: ${userMap[fieldName]}');
      return userMap[fieldName]; // Access the desired field inside 'user'
    }
    return null; // Return null if the field is not found
  }

  // Logout method to clear user data
  Future<void> logout(BuildContext context) async {
    try {
      // Clear user data from shared preferences
      await sharedPreferenceClass.clearValue('user');
      await sharedPreferenceClass.clearValue('isLogin');

      // Reset session controller properties
      user = UserModel();
      isLogin = false;
    } catch (e) {
      debugPrint('Logout Error: $e');
    }
  }

  Future<void> updateUserField(String fieldName, dynamic value) async {
    try {
      if (SessionController().user != null &&
          SessionController().user!.user != null) {
        // Get the current user data from SessionController
        var currentUser = SessionController().user!.user!;

           // Dynamically create the arguments for copyWith for all fields
      final updatedUser = currentUser.copyWith(
        fullname: (fieldName == 'fullname') ? value : currentUser.fullname,
        email: (fieldName == 'email') ? value : currentUser.email,
        password: (fieldName == 'password') ? value : currentUser.password,
        accountMode: (fieldName == 'accountMode') ? value : currentUser.accountMode,
        shopCategory: (fieldName == 'shopCategory') ? value : currentUser.shopCategory,
        otp: (fieldName == 'otp') ? value : currentUser.otp,
        otpExpiry: (fieldName == 'otpExpiry') ? value : currentUser.otpExpiry,
        otpVerification: (fieldName == 'otpVerification') ? value : currentUser.otpVerification,
        shopName: (fieldName == 'shopName') ? value : currentUser.shopName,
        shopAddress: (fieldName == 'shopAddress') ? value : currentUser.shopAddress,
        role: (fieldName == 'role') ? value : currentUser.role,
        country: (fieldName == 'country') ? value : currentUser.country,
        city: (fieldName == 'city') ? value : currentUser.city,
        phone: (fieldName == 'phone') ? value : currentUser.phone,
        verificationDate: (fieldName == 'verificationDate') ? value : currentUser.verificationDate,
        verificationDocuments: (fieldName == 'verificationDocuments') ? value : currentUser.verificationDocuments,
        isAccountModeVerified: (fieldName == 'isAccountModeVerified') ? value : currentUser.isAccountModeVerified,
        isActive: (fieldName == 'isActive') ? value : currentUser.isActive,
        googleId: (fieldName == 'googleId') ? value : currentUser.googleId,
        profileImage: (fieldName == 'profileImage') ? value : currentUser.profileImage,
        idCardFrontImage: (fieldName == 'idCardFrontImage') ? value : currentUser.idCardFrontImage,
        idCardBackImage: (fieldName == 'idCardBackImage') ? value : currentUser.idCardBackImage,
        shopImage: (fieldName == 'shopImage') ? value : currentUser.shopImage,
        passwordResetToken: (fieldName == 'passwordResetToken') ? value : currentUser.passwordResetToken,
        passwordResetExpires: (fieldName == 'passwordResetExpires') ? value : currentUser.passwordResetExpires,
        createdAt: (fieldName == 'createdAt') ? value : currentUser.createdAt,
        updatedAt: (fieldName == 'updatedAt') ? value : currentUser.updatedAt,
        favorites: (fieldName == 'favorites') ? value : currentUser.favorites,
      );


        // Create an updated UserModel with the new user data
        UserModel updatedUserModel = SessionController().user!.copyWith(
              user: updatedUser,
            );

        // Save the updated user data to SharedPreferences
        await SessionController().saveUserInPreference(updatedUserModel);

        debugPrint("Updated '$fieldName' to '$value' in user data.");
      } else {
        debugPrint("User data is not available.");
      }
    } catch (e) {
      debugPrint("Error updating user field '$fieldName': $e");
    }
  }
}
