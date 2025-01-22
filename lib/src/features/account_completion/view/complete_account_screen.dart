import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/custom_text_filed.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/account_completion/view_model/complete_account_view_model.dart';

class CompleteAccountScreen extends StatefulWidget {
  const CompleteAccountScreen({super.key});

  @override
  State<CompleteAccountScreen> createState() => _CompleteAccountScreenState();
}

class _CompleteAccountScreenState extends State<CompleteAccountScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CompleteAccountViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'Complete Your Profile',
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Text(
            "Verify your Identity",
            style: Themetext.headline.copyWith(color: AppColors.primary),
          ),
          SizedBox(height: context.mediaQueryHeight / 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: context.mediaQueryHeight / 70),
              CustomTextFormField(
                hintText: 'Enter your full name',
                controller: viewModel.nameController,
                color: AppColors.greyColor,
                borderColor: Colors.black12,
              ),
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
                hintText: 'Enter your phone no',
                controller: viewModel.phoneNoController,
                color: AppColors.greyColor,
                borderColor: Colors.black12,
              )
            ],
          ),
          SizedBox(height: context.mediaQueryHeight / 35),
          Text(
            "Identity Card Front & Back",
            style: Themetext.headline.copyWith(color: AppColors.primary),
          ),
          SizedBox(height: context.mediaQueryHeight / 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RoundButton(
                width: context.mediaQueryWidth / 2.5,
                textStyle: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                color: AppColors.primaryLight,
                title: 'Clear all',
                onPress: viewModel.clearAll,
              ),
              Consumer<CompleteAccountViewModel>(
                builder: (BuildContext context, value, Widget? child) {
                  return RoundButton(
                      loading: value.loading,
                      width: context.mediaQueryWidth / 2.5,
                      textStyle: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      color: AppColors.primary,
                      title: 'Submit',
                      onPress: () {
                        if (viewModel.validateInputs(context)) {
                          value.compeletProfile(context).then((_) {
                           
                          
                            viewModel.clearAll();
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
