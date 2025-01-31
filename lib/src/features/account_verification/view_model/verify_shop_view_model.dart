import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/splash/services/session_manager/session_controller.dart';
import 'package:testt/src/repository/profile_api/profile_repository.dart';

class VerifyShopViewModel extends ChangeNotifier {
  final ProfileRepository profileRepository;
  VerifyShopViewModel({required this.profileRepository});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController shopAddressController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  File? frontImage;
  File? backImage;
  File? shopImage;
  String? role;
  String? type;

  void setUserRoleAndType(String role, String type) {
    type = type;
    role = role;
    notifyListeners();
  }

  void setProfileDataFromSession() {
    // Retrieve user info from SessionController
    dynamic name = SessionController().user?.user?.fullname.toString();
    dynamic email = SessionController().user?.user?.email.toString();
    dynamic phone = SessionController().user?.user?.phone.toString();

    if (name != null) {
      nameController.text = name;
    }
    if (email != null) {
      emailAddressController.text = email;
    }
    if (phone != null) {
      phoneNoController.text = phone;
    }

    notifyListeners();
  }

  void clearAll() {
    shopNameController.clear();
    shopAddressController.clear();
    emailAddressController.clear();
    phoneNoController.clear();
    frontImage = null;
    backImage = null;
    shopImage = null;
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

  void setShopImage(File? image) {
    shopImage = image;
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
        'fullname': nameController.text.trim(),
        'email': emailAddressController.text.trim(),
        'phone': phoneNoController.text.trim(),
        'shopName': shopNameController.text.trim(),
        'shopAddress': shopAddressController.text.trim(),
      };
      await profileRepository.shopVerification(data,
          idCardFrontImage: frontImage,
          idCardBackImage: backImage,
          shopImage: shopImage);

      setLoading(false);
      await SessionController()
          .updateUserField('fullname', nameController.text.trim());
      await SessionController()
          .updateUserField('email', emailAddressController.text.trim());
      await SessionController()
          .updateUserField('phone', phoneNoController.text.trim());
      await SessionController()
          .updateUserField('shopName', shopNameController.text.trim());
      await SessionController()
          .updateUserField('shopAddress', shopAddressController.text.trim());
      await SessionController().updateUserField('isAccountModeVerified', true);
      setLoading(false);
      Utils.snackBar('Application submitted successfully', context);
    } catch (error) {
      Utils.snackBar('Failed to submitted. Please try again.', context);
      setLoading(false);
    }
  }

}
