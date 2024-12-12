import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testt/src/configs/utils.dart';

class VerifyShopViewModel extends ChangeNotifier {
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController shopAddressController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  File? frontImage;
  File? backImage;

  void clearAll() {
    shopNameController.clear();
    shopAddressController.clear();
    emailAddressController.clear();
    phoneNoController.clear();
    frontImage = null;
    backImage = null;
    notifyListeners(); // Notify UI of state changes
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
    if (shopNameController.text.isEmpty) {
      _showError(context, 'Shop Name is required');
      return false;
    }
    if (shopAddressController.text.isEmpty) {
      _showError(context, 'Shop Address is required');
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
        'shopNameController': shopNameController.text.trim(),
        'shopAddressController': shopAddressController.text.trim(),
        'emailAddressController': emailAddressController.text.trim(),
        'phoneNoController': phoneNoController.text.trim(),
        'frontImage': frontImage,
        'backImage': backImage,
      };
      print('::: data is ${data}');
      Future.delayed(Duration(seconds: 2), () {
        setLoading(false);
        Utils.snackBar('Application submitted successfully', context);
       
      });
      // var response = await authRepository.continueWithPhoneNumberApi(fullPhone);
    } catch (error) {
      Utils.snackBar('Failed to submitted. Please try again.', context);
      setLoading(false);
    }
  }
}
