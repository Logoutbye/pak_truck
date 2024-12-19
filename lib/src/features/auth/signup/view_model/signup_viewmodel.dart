import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/auth/signup/view/signup_verify_otp_screen.dart';
import 'package:testt/src/repository/signup_api/signup_repository.dart';

class SignUpViewModel extends ChangeNotifier {
  final SignUpRepository signUpRepository;

  SignUpViewModel({required this.signUpRepository});

  bool _loading = false;
  bool get loading => _loading;

  bool _showOtpField = false;
  bool get showOtpField => _showOtpField;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void toggleOtpField(bool value) {
    _showOtpField = value;
    notifyListeners();
  }

  Future<void> sendEmailOtp(
      BuildContext context, Map<String, String> data) async {
    setLoading(true);
    try {
      // final response = await signUpRepository.sendEmailOtp(data);
      Utils.flushBarErrorMessage('OTP sent successfully', context);
      toggleOtpField(true);
    } catch (error) {
      Utils.flushBarErrorMessage(error.toString(), context);
    } finally {
      setLoading(false);
    }
  }

  Future<void> reSendEmailOtp(
      BuildContext context, Map<String, String> data) async {
    setLoading(true);
    try {
      // final response = await signUpRepository.reSendEmailOtp(data);
      Utils.flushBarErrorMessage('OTP re-sent successfully', context);
      toggleOtpField(true);
    } catch (error) {
      Utils.flushBarErrorMessage(error.toString(), context);
    } finally {
      setLoading(false);
    }
  }

  Future<void> verifyEmailOtp(
      BuildContext context, Map<String, String> data) async {
    setLoading(true);
    try {
      // final response = await signUpRepository.verifyEmailOtp(data);
      Utils.flushBarErrorMessage('OTP verified successfully', context);
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.chooseAccountScreen, (route) => false);
    } catch (error) {
      Utils.flushBarErrorMessage(error.toString(), context);
    } finally {
      setLoading(false);
    }
  }

//--------------signup with phone

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
      // var response = await signUpRepository.sendPhoneOtp(fullPhone);
      // print(response.success);

      Navigator.push(
          context,
          SlideTransitionPage(
              page: SignUpVerifyOtpScreen(phoneNumber: fullPhoneNumber)));
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
      // var response = await signUpRepository.sendPhoneOtp(fullPhone);
      // print(response.success);

  
    } catch (error) {
      Utils.snackBar('Failed to send OTP. Please try again.', context);
      setLoading(false);
    }
  }

  Future<void> verifyPhoneOtp(BuildContext context, String pin) async {
    setLoading(true);
    try {
      Future.delayed(Duration(seconds: 2), () {
        setLoading(false);
      });
      // var response = await signUpRepository.verifyPhoneOtp(pin);

      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.chooseAccountScreen, (route) => false);
      Utils.snackBar('Otp verified successfully', context);
    } catch (error) {
      Utils.snackBar('Failed to verify OTP. Please try again.', context);
      setLoading(false);
    }
  }
}
