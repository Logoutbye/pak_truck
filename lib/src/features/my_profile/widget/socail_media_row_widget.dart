import 'package:flutter/material.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/configs/color/color.dart';

class SocialMediaRowWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SocialMediaRowWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 40, // Set the size of the image as needed
                height: 40,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Themetext.headline,
                  ),
                  Text(
                    subtitle,
                    style: Themetext.headline
                        .copyWith(color: AppColors.orange, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: context.mediaQueryHeight / 30),
      ],
    );
  }
}
