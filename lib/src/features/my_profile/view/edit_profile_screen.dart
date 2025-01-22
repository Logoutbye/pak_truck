import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/custom_text_filed.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/my_profile/view_model/edit_profile_view_model.dart';
import 'package:testt/src/features/my_profile/widget/profile_image_picker_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<EditProfileViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        leading: IconButton(
            onPressed: () {
              viewModel.clearAll();
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'Edit Profile',
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          buildProfileImagePicker(context, ''),
          SizedBox(height: context.mediaQueryHeight / 70),
          Divider(color: AppColors.divider),
          SizedBox(height: context.mediaQueryHeight / 70),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: context.mediaQueryHeight / 70),
              CustomTextFormField(
                hintText: 'Enter your name',
                controller: viewModel.nameController,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Country',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: context.mediaQueryHeight / 70),
              CustomTextFormField(
                hintText: 'Enter Your Country',
                controller: viewModel.countryController,
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
                'City',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: context.mediaQueryHeight / 70),
              CustomTextFormField(
                hintText: 'Enter Your City',
                controller: viewModel.cityController,
                color: AppColors.greyColor,
                borderColor: Colors.black12,
              )
            ],
          ),
          SizedBox(height: context.mediaQueryHeight / 35),
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
              Consumer<EditProfileViewModel>(
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
                      title: 'Save Changes',
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
