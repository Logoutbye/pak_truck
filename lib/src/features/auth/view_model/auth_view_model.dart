import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/repository/auth_api/auth_repository.dart';

import '../../../configs/routes/slide_transition_page.dart';
import '../login/view/verify_otp_screen.dart';

class LoginViewModel with ChangeNotifier {
  final AuthRepository authRepository;

  LoginViewModel({required this.authRepository});

  bool _loading = false;
  bool get loading => _loading;

  void setLoginLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

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

  Future<void> sendOtp(BuildContext context) async {
    if (_selectedCountry == null || _phoneNumber.isEmpty) {
      Utils.snackBar(
        'Please select a country and enter a valid phone number.',
        context,
      );
      return;
    }

    setLoginLoading(true);
    try {
      String fullPhone = fullPhoneNumber;
      Future.delayed(Duration(seconds: 2), () {
        print('::: $fullPhone');
        setLoginLoading(false);
      });
      // var response = await authRepository.continueWithPhoneNumberApi(fullPhone);
      Navigator.push(context,
          SlideTransitionPage(page: VerifyOtpScreen(phoneNumber: fullPhone)));
    } catch (error) {
      Utils.snackBar('Failed to send OTP. Please try again.', context);
      setLoginLoading(false);
    }
  }

  Future<void> reSendOtp(BuildContext context) async {
    setLoginLoading(true);
    try {
      String fullPhone = fullPhoneNumber;
      Future.delayed(Duration(seconds: 2), () {
        print('::: $fullPhone');
        setLoginLoading(false);
      });
      // var response = await authRepository.continueWithPhoneNumberApi(fullPhone);

      Utils.snackBar('Otp resent successfully', context);
    } catch (error) {
      Utils.snackBar('Failed to  re-send OTP. Please try again.', context);
      setLoginLoading(false);
    }
  }

  Future<void> verifyOtp(BuildContext context, String pin) async {
    setLoginLoading(true);
    try {
      print(';::: pin $pin');
      Future.delayed(Duration(seconds: 2), () {
        setLoginLoading(false);
      });
      // var response = await authRepository.verifyOtpApi(pin);

      Utils.snackBar('Otp verified successfully', context);
    } catch (error) {
      Utils.snackBar('Failed to verify OTP. Please try again.', context);
      setLoginLoading(false);
    }
  }

  Future<void> signinWithEmail(BuildContext context, dynamic data) async {
    setLoginLoading(true);
    try {
      Future.delayed(Duration(seconds: 2), () {
        setLoginLoading(false);
        Utils.snackBar('Login Successfully', context);
      });
      // var response = await authRepository.signInWithEmailApi(data);
    } catch (error) {
      Utils.snackBar('Failed to Login. Please try again.', context);
      setLoginLoading(false);
    }
  }

  Future<void> signupWithEmail(BuildContext context, dynamic data) async {
    setLoginLoading(true);
    try {
      Future.delayed(Duration(seconds: 2), () {
        setLoginLoading(false);
        Utils.snackBar('User Registrered Scuessfully', context);
      });
      // var response = await authRepository.signUpWithEmailApi(data);
    } catch (error) {
      Utils.snackBar('Failed to send OTP. Please try again.', context);
      setLoginLoading(false);
    }
  }

  Future<void> forgotPassword(BuildContext context, dynamic data) async {
    setLoginLoading(true);
    try {
      Future.delayed(Duration(seconds: 2), () {
        setLoginLoading(false);
        Utils.snackBar('Code Sent successfully on your email', context);
      });
    } catch (error) {
      Utils.snackBar('Failed to send code. Please try again.', context);
      setLoginLoading(false);
    }
  }

  Future<void> resetPassword(BuildContext context, dynamic data) async {
    setLoginLoading(true);
    try {
      Future.delayed(Duration(seconds: 2), () {
        setLoginLoading(false);
        Utils.snackBar('Code Sent successfully on your email', context);
      });
    } catch (error) {
      Utils.snackBar('Failed to send code. Please try again.', context);
      setLoginLoading(false);
    }
  }
}
