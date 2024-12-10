import 'package:flutter/material.dart';
import 'package:testt/src/configs/extensions.dart'; // Assuming this contains mediaQueryHeight extension
import '../color/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  // Optional parameters with default values
  final double? height; // Nullable to calculate dynamically if not provided
  final double? width;
  final Color color;
  final Color borderColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final Color loadingIndicatorColor;

  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPress,
    this.height,
    this.width,
    this.color = AppColors.primaryColor,
    this.borderColor = Colors.transparent,
    this.borderRadius = 10.0,
    this.textStyle,
    this.loadingIndicatorColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPress,
      child: Container(
        height: height ?? context.mediaQueryHeight / 18,
        width: width ?? context.mediaQueryWidth / 1.2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator(color: loadingIndicatorColor)
              : Text(
                  title,
                  style: textStyle ??
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                ),
        ),
      ),
    );
  }
}
