import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testt/src/configs/utils.dart';

class VerifyIndividualViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  File? frontImage;
  File? backImage;

  String? role;

  String _email = '';
  String get email => _email;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  String _otp = '';
  String get otp => _otp;
  void setOtp(String otp) {
    _otp = otp;
    notifyListeners();
  }

  String _phoneNo = '';
  String get phoneNo => _phoneNo;
  void setPhoneNo(String phoneNo) {
    _phoneNo = phoneNo;
    notifyListeners();
  }

  void setUserRole(String role) {
    role = role;
    notifyListeners();
  }

  void setFrontImage(File? image) {
    frontImage = image;
    notifyListeners();
  }

  void setBackImage(File? image) {
    backImage = image;
    notifyListeners();
  }

  bool validateInputs(BuildContext context) {
    if (nameController.text.isEmpty) {
      _showError(context, 'Name is required');
      return false;
    }

    if (emailAddressController.text.isEmpty ||
        !emailAddressController.text.contains('@')) {
      _showError(context, 'Valid Email Address is required');
      return false;
    }
    if (phoneNoController.text.isEmpty) {
      _showError(context, 'Valid Phone Number is required');
      return false;
    }
    if (frontImage == null) {
      _showError(context, 'Front Image is required');
      return false;
    }
    if (backImage == null) {
      _showError(context, 'Back Image is required');
      return false;
    }
    return true;
  }

  void _showError(BuildContext context, String message) {
    Utils.flushBarErrorMessage(message, context);
  }

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> submitData(BuildContext context) async {
    setLoading(true);
    try {
      var data = {
        if (email.isNotEmpty) "email": email.toString(),
        if (phoneNo.isNotEmpty) "phoneNo": phoneNo.toString(),
        'nameController': nameController.text.trim(),
        'emailAddressController': emailAddressController.text.trim(),
        'phoneNoController': phoneNoController.text.trim(),
        'frontImage': frontImage,
        'backImage': backImage,
      };
      Future.delayed(Duration(seconds: 2), () {
        // setLoading(false);
        // Utils.snackBar('Application submitted successfully', context);
      });
      // var response = await authRepository.continueWithPhoneNumberApi(fullPhone);
    } catch (error) {
      Utils.snackBar('Failed to submitted. Please try again.', context);
      setLoading(false);
    }
  }

  void clearAll() {
    nameController.clear();
    emailAddressController.clear();
    phoneNoController.clear();
    frontImage = null;
    backImage = null;
    notifyListeners(); // Notify UI of state changes
  }
}
