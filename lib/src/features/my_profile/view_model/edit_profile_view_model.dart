import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testt/src/configs/utils.dart';

class EditProfileViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  File? profileImage;

  void setProfileImage(File? image) {
    profileImage = image;
    notifyListeners();
  }

  void clearAll() {
    nameController.clear();
    countryController.clear();
    emailAddressController.clear();
    phoneNoController.clear();
    profileImage = null;

    notifyListeners(); // Notify UI of state changes
  }

  bool validateInputs(BuildContext context) {
    if (nameController.text.isEmpty) {
      _showError(context, 'Please Enter Your Name.');
      return false;
    }
    if (countryController.text.isEmpty) {
      _showError(context, 'Please Enter Your Country Name.');
      return false;
    }
    if (emailAddressController.text.isEmpty ||
        !emailAddressController.text.contains('@')) {
      _showError(context, 'Valid Email Address is required');
      return false;
    }
    if (phoneNoController.text.isEmpty) {
      _showError(context, 'Please Enter Valid Phone Number');
      return false;
    }
    if (profileImage == null) {
      _showError(context, 'Please Choose Profile Image');
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
        'shopNameController': nameController.text.trim(),
        'shopAddressController': countryController.text.trim(),
        'emailAddressController': emailAddressController.text.trim(),
        'phoneNoController': phoneNoController.text.trim(),
        'frontImage': profileImage,
      };
      Future.delayed(Duration(seconds: 2), () {
        setLoading(false);
        Utils.snackBar('Application submitted successfully', context);
      });
      // var response = await authRepository.continueWithPhoneNumberApi(fullPhone);
    } catch (error) {
      Utils.snackBar('Failed to submitted. Please try again.', context);
      setLoading(false);
    } finally {
      clearAll();
    }
  }
}
