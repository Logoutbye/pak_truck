import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Color color;
  final Color borderColor;
  final ValueChanged<Country?>? onCountrySelected;
  final ValueChanged<String>? onPhoneNumberChanged;
  final bool isPassword;
  final int? minLines; // Minimum number of lines
  final int? maxLines; // Maximum number of lines

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onCountrySelected,
    this.color = Colors.transparent,
    this.borderColor = Colors.black38,
    this.onPhoneNumberChanged,
    this.isPassword = false,
    this.minLines = 1, // Allow customization of minimum lines
    this.maxLines, // Allow customization of maximum lines
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  Country? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.minLines! >= 2
          ? context.mediaQueryHeight / 8
          : context.mediaQueryHeight / 18,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: widget.borderColor),
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword,
        style: Themetext.subheadline,
        minLines: widget.minLines ?? 1, // Default to 1 line
        maxLines: widget.maxLines ?? 1, // Default to single-line input
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
              vertical: 14, horizontal: 10), // Adjust padding for centering
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w200,
            fontSize: 15,
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        onChanged: (value) {
          if (widget.onPhoneNumberChanged != null) {
            widget.onPhoneNumberChanged!(value);
          }
        },
      ),
    );
  }
}
