import 'package:flutter/material.dart';
import 'package:testt/src/configs/color/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? trailing;
  final String firstText;
  final String secondText;
  final TextStyle? firstTextStyle;
  final TextStyle? secondTextStyle;

  const CustomAppBar({
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
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: firstText,
              style: firstTextStyle ??
                  const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
            ),
            TextSpan(
              text: secondText,
              style: secondTextStyle ??
                  const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
        textAlign: TextAlign.center, // Center aligns the text
      ),
      actions: trailing != null ? [trailing!] : [SizedBox(width: 48)], // Maintain symmetry
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
