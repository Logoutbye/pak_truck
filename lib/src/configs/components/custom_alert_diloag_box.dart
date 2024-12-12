import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final List<TextSpan> contentSpans; // Support for styled content
  final String buttonText;
  final VoidCallback onButtonPressed;
  final String? icon;
  final Color buttonColor;
  final Color iconColor;
  final String cancelButtonText;
  final VoidCallback onCancelPressed;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.contentSpans,
    required this.buttonText,
    required this.onButtonPressed,
    this.icon,
    this.buttonColor = AppColors.primaryColor,
    this.iconColor = AppColors.primaryColor,
    this.cancelButtonText = 'Cancel',
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(29),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null && icon!.isNotEmpty)
            icon!.endsWith('.svg')
                ? SvgPicture.asset(icon!, color: iconColor,)
                : Image.asset(icon!, height: 24, width: 24, color: iconColor),
          if (icon != null && icon!.isNotEmpty) SizedBox(width: 8),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: TextSpan(
              children: contentSpans,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundButton(
              borderRadius: 15,
              width: context.mediaQueryWidth / 3.5,
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              color: AppColors.greyColor,
              title: cancelButtonText,
              onPress: onCancelPressed,
            ),
            RoundButton(
              borderRadius: 15,
              width: context.mediaQueryWidth / 3.5,
              textStyle: const TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              color: AppColors.redLight,
              title: buttonText,
              onPress: onButtonPressed,
            ),
          ],
        ),
      ],
    );
  }
}

// Usage Example:
// CustomAlertDialog(
//   title: 'Logout',
//   contentSpans: [
//     TextSpan(
//       text: 'Are you sure you want to ',
//       style: TextStyle(color: Colors.black),
//     ),
//     TextSpan(
//       text: 'log out',
//       style: TextStyle(color: Colors.red),
//     ),
//     TextSpan(
//       text: ' your account?',
//       style: TextStyle(color: Colors.black),
//     ),
//   ],
//   buttonText: 'Logout',
//   onButtonPressed: () {
//     // Handle logout logic
//   },
//   icon: 'assets/icons/logout.svg', // Or null if no icon
//   onCancelPressed: () {
//     Navigator.pop(context);
//   },
// );
