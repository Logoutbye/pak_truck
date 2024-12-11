import 'package:flutter/material.dart';
import 'package:testt/src/configs/color/color.dart';

class OnBoardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? trailing;
  final String firstText;
  final String secondText;
  final TextStyle? firstTextStyle;
  final TextStyle? secondTextStyle;

  const OnBoardingAppBar({
    super.key,
    this.leading,
    this.trailing,
    required this.firstText,
    required this.secondText,
    this.firstTextStyle,
    this.secondTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading ??
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: const Icon(Icons.arrow_back),
            ),
          ),
      title: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(firstText,
                style: firstTextStyle ??
                    TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500)),
            Text(secondText,
                style: secondTextStyle ??
                    TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500)),
          ],
        ),
      ),
      actions: trailing != null ? [trailing!] : null,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
