import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../model/user/user_model.dart';
import '../storage/local_storage.dart';

// Singleton class
class SessionController {
  LocalStorage sharedPreferenceClass = LocalStorage();
  static final SessionController _session = SessionController._internal();

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
    user = null;
  }

  Future<String?> getUserToken() async {
    if (_token != null) {
      return _token; // Return cached token if already loaded
    }

    final SharedPreferences sp = await SharedPreferences.getInstance();
    _token = sp.getString('token');
    return _token;
  }

  // Save the complete user data into shared preferences
  Future<void> saveUserInPreference(UserModel user) async {
    try {
      // Save the user object as JSON
      String userJson = jsonEncode(user.toJson());
      await sharedPreferenceClass.setValue('user', userJson);

      // Save additional login state
      await sharedPreferenceClass.setValue('isLogin', 'true');

      _token = user.token; // Cache the token locally

      // Update current session data
      this.user = user;
      this.isLogin = true;
    } catch (e) {
      debugPrint('Error saving user: $e');
    }
  }

  // Retrieve the complete user data from shared preferences
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

  // Get a specific field from the user's data
  dynamic getUserField(String fieldName) {
    if (user != null) {
      var userMap = user!.toJson();
      return userMap[fieldName];
    }
    return null;
  }
}




// // Save user data
// SessionController().saveUserInPreference(user);

// // Retrieve user data and update session
// await SessionController().getUserFromPreference();

// // Access user details
// String? token = SessionController().getUserField('token');
// int? userId = SessionController().getUserField('id');
