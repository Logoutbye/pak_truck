

import 'package:flutter/material.dart';
import 'package:testt/src/configs/color/color.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: AppColors.white),
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
