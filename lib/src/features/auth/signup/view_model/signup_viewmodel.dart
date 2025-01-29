import 'dart:math';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/auth/signup/view/signup_verify_otp_screen.dart';
import 'package:testt/src/features/auth/update_n_forgot_password/view/reset_password_otp_screen.dart';
import 'package:testt/src/features/splash/services/session_manager/session_controller.dart';
import 'package:testt/src/model/user/user_model.dart';
import 'package:testt/src/repository/auth_api/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthViewModel({required this.authRepository});

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

//--------------signup

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;

  void setPhonenuber(String phone) {
    _phoneNumber = phone;
    notifyListeners();
  }

  Country? _selectedCountry;
  Country? get selectedCountry => _selectedCountry;

  void setSelectedCountry(Country country) {
    _selectedCountry = country;
    notifyListeners();
  }

  String get fullPhoneNumber {
    if (_selectedCountry == null || _phoneNumber.isEmpty) {
      return '';
    }
    return '+${_selectedCountry!.phoneCode}$_phoneNumber';
  }

  Future<void> sendPhoneOtp(BuildContext context) async {
    // bill
    if (_selectedCountry == null || _phoneNumber.isEmpty) {
      Utils.snackBar(
        'Please select a country and enter a valid phone number.',
        context,
      );
      return;
    }

    setLoading(true);
    try {
      var data = {'phone': fullPhoneNumber};
      await authRepository.sendPhoneOtp(data);

      setLoading(false);
      Navigator.push(
          context,
          SlideTransitionPage(
              page: SignUpVerifyOtpScreen(phoneNumber: fullPhoneNumber)));
    } catch (error) {
      Utils.snackBar('Failed to send OTP. Please try again.', context);
      setLoading(false);
    }
  }

  Future<void> verifyOtp(
      BuildContext context, String pin, String phoneNumberr) async {
    setLoading(true);
    try {
      var data = {'identifier': phoneNumberr, 'otp': pin};
      var response = await authRepository.verifyPhoneOtp(data);
      var isNewUser = response['isUserNew'];

      // Parse the response into a UserModel object
      UserModel userModel = UserModel.fromJson(response);
      SessionController().saveUserInPreference(userModel);
      setLoading(false);
      Navigator.pushNamedAndRemoveUntil(
          context,
          isNewUser == true
              ? RoutesName.chooseAccountScreen
              : RoutesName.dashboard,
          (route) => false);

      Utils.snackBar('Otp verified successfully', context);
    } catch (error) {
      Utils.snackBar('Failed to verify OTP. Please try again.', context);
      setLoading(false);
    }
  }

  Future<void> reSendPhoneOtp(BuildContext context) async {
    // bill
    if (_selectedCountry == null || _phoneNumber.isEmpty) {
      Utils.snackBar(
        'Please select a country and enter a valid phone number.',
        context,
      );
      return;
    }

    setLoading(true);
    try {
      var data = {'phone': fullPhoneNumber};
      await authRepository.sendPhoneOtp(data);

      setLoading(false);
    } catch (error) {
      Utils.snackBar('Failed to send OTP. Please try again.', context);
      setLoading(false);
    }
  }

//--------------signup
  Future<void> signinWithEmail(BuildContext context, dynamic data) async {
    setLoading(true);
    try {
      var response = await authRepository.signInEmail(data);

      UserModel userModel = UserModel.fromJson(response);
      SessionController().saveUserInPreference(userModel);

      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.dashboard, (route) => false);
      setLoading(false);
      Utils.snackBar('Login Successfull', context);
    } catch (error) {
      Utils.snackBar(error.toString(), context);
      setLoading(false);
    }
  }

  Future<void> signUpWithEmail(BuildContext context, dynamic data) async {
    setLoading(true);
    try {
      var response = await authRepository.signupEmail(data);
      // Parse the response into a UserModel object
      UserModel userModel = UserModel.fromJson(response);
      SessionController().saveUserInPreference(userModel);

      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.chooseAccountScreen, (route) => false);
      setLoading(false);
      Utils.snackBar('SignUp Successfull', context);
    } catch (error) {
      Utils.snackBar(error.toString(), context);
      setLoading(false);
    }
  }

//--------------foregt password
  Future<void> forgotPassword(BuildContext context, String email) async {
    setLoading(true);
    try {
      var data = {"email": email};
      var response = await authRepository.forgotPasswordApi(data);
      print('::: response ${response}');
      // Utils.snackBar(response['message'], context);
      setLoading(false);
      Navigator.push(
          context,
          SlideTransitionPage(
              page: ResetPasswordVerifyOtpScreen(email: email)));
    } catch (error) {
      Utils.snackBar(error.toString(), context);
      setLoading(false);
    }
  }

  Future<void> resetPassword(BuildContext context, dynamic data) async {
    setLoading(true);
    try {
      Future.delayed(Duration(seconds: 2), () {
        setLoading(false);
        Utils.snackBar('Code Sent successfully on your email', context);
      });
    } catch (error) {
      Utils.snackBar('Failed to send code. Please try again.', context);
      setLoading(false);
    }
  }
}
