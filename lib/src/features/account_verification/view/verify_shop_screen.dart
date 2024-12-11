import 'package:flutter/material.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/custom_appbar.dart';
import 'package:testt/src/configs/components/custom_text_filed.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/auth/signup/view/signup_view_with_number.dart';

class VerifyShopScreen extends StatefulWidget {
  const VerifyShopScreen({super.key});

  @override
  State<VerifyShopScreen> createState() => _VerifyShopScreenState();
}

class _VerifyShopScreenState extends State<VerifyShopScreen> {
  TextEditingController _shopNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(firstText: 'Verification Process', secondText: ''),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Text(
            "Verify your Shop Through Identy",
            style: Themetext.headline.copyWith(color: AppColors.primaryColor),
          ),
          SizedBox(height: context.mediaQueryHeight / 40),
          Text('Verify my identity using these Steps'),
          SizedBox(height: context.mediaQueryHeight / 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Shop Name'),
              SizedBox(height: context.mediaQueryHeight / 70),
              CustomTextFormField(
                hintText: '',
                controller: _shopNameController,
                color: AppColors.greyColor,
                borderColor: Colors.black12,
              )
            ],
          )
        ],
      ),
    );
  }
}
