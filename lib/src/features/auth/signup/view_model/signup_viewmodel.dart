import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/auth/signup/view/signup_verify_otp_screen.dart';
import 'package:testt/src/features/splash/services/session_manager/session_controller.dart';
import 'package:testt/src/model/user/user_model.dart';
import 'package:testt/src/repository/auth_api/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthViewModel({required this.authRepository});

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

      var data = {'identifier': fullPhoneNumber, 'otp': pin};
      var response = await authRepository.verifyPhoneOtp(data);

      // Parse the response into a UserModel object
      UserModel userModel = UserModel.fromJson(response);
      SessionController().saveUserInPreference(userModel);

      Navigator.pushNamedAndRemoveUntil(
          context,
          userModel.user?.accountMode != null
              ? RoutesName.chooseAccountScreen
              : RoutesName.dashboard,
          (route) => false);

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
      String fullPhone = 'fullPhoneNumber';
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
