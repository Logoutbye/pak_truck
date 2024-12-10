import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testt/src/configs/color/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String svgIconPath;
  final bool isPassword;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.svgIconPath,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.greyColor,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 5, left: 10),
            child: SizedBox(
              height: 20,
              width: MediaQuery.of(context).size.width / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(svgIconPath),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 42,
                  ),
                  Container(
                    height: 20,
                    width: 2,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ],
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.greyColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}
