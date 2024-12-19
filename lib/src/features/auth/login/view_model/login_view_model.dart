import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/auth/login/view/login_verify_otp_screen.dart';
import 'package:testt/src/repository/signup_api/signup_repository.dart';

class LoginViewModel with ChangeNotifier {
  final SignUpRepository authRepository;

  LoginViewModel({required this.authRepository});

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
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

  Future<void> sendPhoneOtp(BuildContext context) async {
    if (_selectedCountry == null || _phoneNumber.isEmpty) {
      Utils.snackBar(
        'Please select a country and enter a valid phone number.',
        context,
      );
      return;
    }

    setLoading(true);
    try {
      String fullPhone = fullPhoneNumber;
      Future.delayed(Duration(seconds: 2), () {
        setLoading(false);
      });
      var response = await authRepository.sendPhoneOtp(fullPhone);
      print(response.success);

      Navigator.push(
          context,
          SlideTransitionPage(
              page: LoginVerifyOtpScreen(phoneNumber: fullPhoneNumber)));
    } catch (error) {
      Utils.snackBar('Failed to send OTP. Please try again.', context);
      setLoading(false);
    }
  }

  Future<void> reSendPhoneOtp(BuildContext context) async {
    if (_selectedCountry == null || _phoneNumber.isEmpty) {
      Utils.snackBar(
        'Please select a country and enter a valid phone number.',
        context,
      );
      return;
    }

    setLoading(true);
    try {
      String fullPhone = fullPhoneNumber;
      Future.delayed(Duration(seconds: 2), () {
        setLoading(false);
      });
      var response = await authRepository.sendPhoneOtp(fullPhone);
      print(response.success);

      Navigator.push(
          context,
          SlideTransitionPage(
              page: LoginVerifyOtpScreen(phoneNumber: fullPhoneNumber)));
    } catch (error) {
      Utils.snackBar('Failed to send OTP. Please try again.', context);
      setLoading(false);
    }
  }

  Future<void> verifyOtp(BuildContext context, String pin) async {
    setLoading(true);
    try {
      Future.delayed(Duration(seconds: 2), () {
        setLoading(false);
      });
      // var response = await authRepository.verifyOtpApi(pin);

      Utils.snackBar('Otp verified successfully', context);
    } catch (error) {
      Utils.snackBar('Failed to verify OTP. Please try again.', context);
      setLoading(false);
    }
  }

  Future<void> signinWithEmail(BuildContext context, dynamic data) async {
    setLoading(true);
    try {
      Future.delayed(Duration(seconds: 2), () {
        setLoading(false);
        Utils.snackBar('Login Successfully', context);
      });
      // var response = await authRepository.signInWithEmailApi(data);
    } catch (error) {
      Utils.snackBar('Failed to Login. Please try again.', context);
      setLoading(false);
    }
  }

  Future<void> signupWithEmail(BuildContext context, dynamic data) async {
    setLoading(true);
    try {
      Future.delayed(Duration(seconds: 2), () {
        setLoading(false);
        Utils.snackBar('User Registrered Scuessfully', context);
      });
      // var response = await authRepository.signUpWithEmailApi(data);
    } catch (error) {
      Utils.snackBar('Failed to send OTP. Please try again.', context);
      setLoading(false);
    }
  }

  Future<void> forgotPassword(BuildContext context, dynamic data) async {
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

  Future<void> reSendEmailOtp(BuildContext context, dynamic data) async {
    setLoading(true);
    try {
      String fullPhone = fullPhoneNumber;
      Future.delayed(Duration(seconds: 2), () {
        setLoading(false);
      });
      var response = await authRepository.sendEmailOtp(fullPhone);
    } catch (error) {
      Utils.snackBar('Failed to send OTP. Please try again.', context);
      setLoading(false);
    }
  }


}
