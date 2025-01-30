import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/splash/services/session_manager/session_controller.dart';
import 'package:testt/src/model/user/user_model.dart';
import 'package:testt/src/repository/profile_api/profile_repository.dart';

class EditProfileViewModel extends ChangeNotifier {
  final ProfileRepository profileRepository;

  EditProfileViewModel({required this.profileRepository});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  File? profileImage;

  // Method to pre-fill controllers with fetched user data
  void setProfileData(User user) {
    nameController.text = user.fullname;
    emailAddressController.text = user.email;
    phoneNoController.text = user.phone;
    countryController.text = user.country;
    cityController.text = user.city;
    notifyListeners();
  }

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
        'email': emailAddressController.text.trim(),
        'phone': phoneNoController.text.trim(),
        'fullname': nameController.text.trim(),
        'country': countryController.text.trim(),
        'city': cityController.text.trim(),
      };

      var response =
          await profileRepository.editProfile(data, profileImage: profileImage);
      var updatedUserData = response['data']['user'];

      // Update the fields individually using SessionController
      await SessionController()
          .updateUserField('phone', updatedUserData['phone']);
      await SessionController()
          .updateUserField('email', updatedUserData['email']);
      await SessionController()
          .updateUserField('fullname', updatedUserData['fullname']);
      await SessionController()
          .updateUserField('country', updatedUserData['country']);
      await SessionController()
          .updateUserField('city', updatedUserData['city']);

      setLoading(false);
      Navigator.pop(context);
      Utils.snackBar('Profile Updated Scuessfully.', context);
    } catch (error) {
      Utils.flushBarErrorMessage(
          'Failed to Update Profile. Please try again.', context);
      setLoading(false);
    }
  }
}
