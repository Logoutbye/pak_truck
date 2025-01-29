import 'dart:async';
import 'package:flutter/material.dart';
import '../session_manager/session_controller.dart';
import '../../../../configs/routes/routes_name.dart';

class SplashServices {
  void checkAuthentication(BuildContext context) async {
    SessionController().getUserFromPreference().then((value) async {
      await SessionController().getIsLanguageSelectedFromPreference();
      var isLanguageSelected = SessionController().isLanguageSelected;

      if (SessionController().isLogin!) {
              var token = SessionController().token;
      print('::: token ::: $token');
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.dashboard, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context,
            isLanguageSelected == true
                ? RoutesName.signupViewWithNumber
                : RoutesName.selectLanguageScreen,
            (route) => false);
      }
    }).onError((error, stackTrace) {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.loginViewWithNumber, (route) => false),
      );
    });
  }
}
