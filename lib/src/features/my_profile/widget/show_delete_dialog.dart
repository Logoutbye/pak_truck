import 'package:flutter/material.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/custom_alert_diloag_box.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/features/splash/services/session_manager/session_controller.dart';

void showDeleteDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
            title: '',
            iconColor: AppColors.red,
            contentSpans: [
              TextSpan(
                text: 'Are you Sure you want to \n',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: 'Delete your account',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ],
            buttonText: 'Delete',
            onButtonPressed: () {
              // Handle logout logic
              SessionController().clearUserSession().then((_) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutesName.splash, (route) => false);
              });
            },
            icon: 'assets/svg/logout_right.svg', // Or null if no icon
            onCancelPressed: () {
              Navigator.pop(context);
            },
          ));
}
