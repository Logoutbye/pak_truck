import 'package:flutter/material.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/repository/auth_api/auth_repository.dart';

class SignUpViewModel extends ChangeNotifier {
  final AuthRepository authRepository;

  SignUpViewModel({required this.authRepository});

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
      final response = await authRepository.sendEmailOtp(data);
      Utils.flushBarErrorMessage('OTP sent successfully', context);
      toggleOtpField(true);
    } catch (error) {
      Utils.flushBarErrorMessage(error.toString(), context);
    } finally {
      setLoading(false);
    }
  }
}
