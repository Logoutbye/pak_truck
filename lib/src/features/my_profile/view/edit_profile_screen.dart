import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/custom_text_filed.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/data/response/status.dart';
import 'package:testt/src/features/my_profile/view_model/edit_profile_view_model.dart';
import 'package:testt/src/features/my_profile/view_model/my_profile_view_model.dart';
import 'package:testt/src/features/my_profile/widget/profile_consumer_widget.dart';
import 'package:testt/src/features/my_profile/widget/profile_image_picker_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    super.initState();
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    final editProfileViewModel =
        Provider.of<EditProfileViewModel>(context, listen: false);

    Future.microtask(() {
      // Check if profile data hasn't been fetched yet
      if (profileViewModel.myProfile.status == Status.notStarted ||
          profileViewModel.myProfile.status == Status.loading) {
        // Fetch profile data if not started or loading
        profileViewModel.fetchMyProfileApi().then((_) {
          // Once data is fetched, check and set it into the EditProfileViewModel
          final user = profileViewModel.myProfile.data?.user;
          if (user != null) {
            editProfileViewModel.setProfileData(user);
          }
        });
      } else if (profileViewModel.myProfile.status == Status.completed) {
        // Profile data is already available, directly set it into the EditProfileViewModel
        final user = profileViewModel.myProfile.data?.user;
        if (user != null) {
          editProfileViewModel.setProfileData(user);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final editProfileViewModel = Provider.of<EditProfileViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        leading: IconButton(
            onPressed: () {
              editProfileViewModel.clearAll();
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'Edit Profile',
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: Consumer<ProfileViewModel>(
        builder: (BuildContext context, value, Widget? child) {
          // Check if profile data is still loading
          if (value.myProfile.status == Status.loading) {
            return ShimmerLoadingWidget();
          }

          final profileState = value.myProfile;
          final user = profileState.data?.user;

          return ListView(
            padding: EdgeInsets.all(12),
            children: [
              buildProfileImagePicker(context, user?.profileImage ?? ''),
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
                    controller: editProfileViewModel.nameController,
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
                    controller: editProfileViewModel.emailAddressController,
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
                    controller: editProfileViewModel.phoneNoController,
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
                    controller: editProfileViewModel.countryController,
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
                    controller: editProfileViewModel.cityController,
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
                    onPress: editProfileViewModel.clearAll,
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
                            if (editProfileViewModel.validateInputs(context)) {
                              value.submitData(context);
                            }
                          });
                    },
                  ),
                ],
              ),
              SizedBox(height: context.mediaQueryHeight / 20),
            ],
          );
        },
      ),
    );
  }
}
