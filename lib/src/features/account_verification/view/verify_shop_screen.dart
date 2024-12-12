import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/custom_text_filed.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/account_verification/view_model/verify_shop_view_model.dart';
import 'package:testt/src/features/account_verification/widgets/image_picker_widget.dart';

class VerifyShopScreen extends StatefulWidget {
  const VerifyShopScreen({super.key});

  @override
  State<VerifyShopScreen> createState() => _VerifyShopScreenState();
}

class _VerifyShopScreenState extends State<VerifyShopScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<VerifyShopViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'Verification Process',
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Text(
            "Verify your Shop Through Identy",
            style: Themetext.headline.copyWith(color: AppColors.primaryColor),
          ),
          SizedBox(height: context.mediaQueryHeight / 40),
          Text('Verify my identity using these Steps'),
          SizedBox(height: context.mediaQueryHeight / 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shop Name',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: context.mediaQueryHeight / 70),
              CustomTextFormField(
                hintText: 'Enter your shop name',
                controller: viewModel.shopNameController,
                color: AppColors.greyColor,
                borderColor: Colors.black12,
              )
            ],
          ),
          SizedBox(height: context.mediaQueryHeight / 35),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shop Address',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: context.mediaQueryHeight / 70),
              CustomTextFormField(
                hintText: 'Enter your shop address',
                controller: viewModel.shopAddressController,
                color: AppColors.greyColor,
                borderColor: Colors.black12,
              )
            ],
          ),
          SizedBox(height: context.mediaQueryHeight / 35),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email Address',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: context.mediaQueryHeight / 70),
              CustomTextFormField(
                hintText: 'Enter your email address',
                controller: viewModel.emailAddressController,
                color: AppColors.greyColor,
                borderColor: Colors.black12,
              )
            ],
          ),
          SizedBox(height: context.mediaQueryHeight / 35),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phone number',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: context.mediaQueryHeight / 70),
              CustomTextFormField(
                hintText: 'Enter Your Phone No',
                controller: viewModel.phoneNoController,
                color: AppColors.greyColor,
                borderColor: Colors.black12,
              )
            ],
          ),
          SizedBox(height: context.mediaQueryHeight / 35),
          Text(
            "Identity Card Front & Back",
            style: Themetext.headline.copyWith(color: AppColors.primaryColor),
          ),
          SizedBox(height: context.mediaQueryHeight / 70),
          buildImagePicker(context, 'Upload Front Photo', true),
          SizedBox(height: context.mediaQueryHeight / 35),
          buildImagePicker(context, 'Upload Back Photo', false),
          SizedBox(height: context.mediaQueryHeight / 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RoundButton(
                width: context.mediaQueryWidth / 2.5,
                textStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                color: AppColors.primaryLight,
                title: 'Clear all',
                onPress: viewModel.clearAll,
              ),
              Consumer<VerifyShopViewModel>(
                builder: (BuildContext context, value, Widget? child) {
                  return RoundButton(
                      loading: value.loading,
                      width: context.mediaQueryWidth / 2.5,
                      textStyle: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      color: AppColors.primaryColor,
                      title: 'Submit',
                      onPress: () {
                        if (viewModel.validateInputs(context)) {
                          value.submitData(context).then((_) {
                            Navigator.pushNamedAndRemoveUntil(context,
                                RoutesName.dashboard, (routes) => false);
                          }).onError((error, stackTrace) {
                            Utils.flushBarErrorMessage(
                                error.toString(), context);
                          });
                        }
                      });
                },
              ),
            ],
          ),
          SizedBox(height: context.mediaQueryHeight / 20),
        ],
      ),
    );
  }
}
