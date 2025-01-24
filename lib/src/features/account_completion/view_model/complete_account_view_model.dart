import 'package:flutter/material.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/repository/auth_api/auth_repository.dart';

class CompleteAccountViewModel extends ChangeNotifier {
  final AuthRepository signUpRepository;
  CompleteAccountViewModel({required this.signUpRepository});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  String? accountType;
  String? shopType;

  void setUserRole(String role) {
    role = role;
    notifyListeners();
  }

  void setUserRoleAndType(String rolee, String typee) {
    accountType = rolee;
    shopType = typee;

    notifyListeners();
  }

  bool validateInputs(BuildContext context) {
    if (nameController.text.isEmpty) {
      Utils.flushBarErrorMessage('Name is required', context);
      return false;
    }

    if (emailAddressController.text.isEmpty ||
        !emailAddressController.text.contains('@')) {
      Utils.flushBarErrorMessage('Valid Email Address is required', context);
      return false;
    }
    if (phoneNoController.text.isEmpty) {
      Utils.flushBarErrorMessage('Valid Phone Number is required', context);
      return false;
    }

    return true;
  }

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> selectAccountMode(
      BuildContext context, bool isIndividual, String userId) async {
    setLoading(true);
    try {
      var data = isIndividual
          ? {'userId': userId, 'accountMode': 'individual'}
          : {'userId': userId, 'accountMode': 'shop', 'shopCategory': shopType};
      print(data);
      await signUpRepository.selectAccountMode(data);
      setLoading(false);
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.dashboard, (route) => false);
    } catch (error) {
      Utils.snackBar('Failed to submitted. Please try again.', context);
      setLoading(false);
    }
  }

  Future<void> compeletProfile(BuildContext context) async {
    setLoading(true);
    try {
      var data = {
        'userId': '',
        'accountMode': '',
      };
      Future.delayed(Duration(seconds: 2), () {
        setLoading(false);
        Utils.snackBar('Profile Completed Sucessfully', context);
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.dashboard, (routes) => false);
      });
      // var response = await signUpRepository.completeProfile(data);
    } catch (error) {
      Utils.snackBar('Failed. Please try again.', context);
      setLoading(false);
    }
  }

  void clearAll() {
    nameController.clear();
    emailAddressController.clear();
    phoneNoController.clear();
    notifyListeners();
  }
}
