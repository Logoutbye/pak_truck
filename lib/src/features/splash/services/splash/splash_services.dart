import 'dart:async';
import 'package:flutter/material.dart';
import '../session_manager/session_controller.dart';
import '../../../../configs/routes/routes_name.dart';

class SplashServices {
  void checkAuthentication(BuildContext context) async {
    SessionController().getUserFromPreference().then((value) async {
      if (SessionController().isLogin!) {
        // Timer(
        //   const Duration(seconds: 2),
        //   () =>

        // Navigator.pushNamedAndRemoveUntil(
        //     context, RoutesName.home, (route) => false);
        // );
      } else {
        // Timer(
        //   const Duration(seconds: 2),
        //   () =>

        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.dashboard, (route) => false);
        // );
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
