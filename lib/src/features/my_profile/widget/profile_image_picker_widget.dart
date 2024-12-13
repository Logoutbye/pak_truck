import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/my_profile/view_model/edit_profile_view_model.dart';
import 'package:testt/src/features/my_profile/widget/user_image_avatar_widget.dart';

Widget buildProfileImagePicker(BuildContext context, String networkImage) {
  final viewModel = Provider.of<EditProfileViewModel>(context, listen: false);

  Future<void> showImageSourceActionSheet() async {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a Photo'),
                titleTextStyle: Themetext.blackBoldText,
                onTap: () async {
                  Navigator.pop(context); // Close the bottom sheet
                  final picker = ImagePicker();
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    final image = File(pickedFile.path);

                    viewModel.setProfileImage(image);
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                titleTextStyle: Themetext.blackBoldText,
                onTap: () async {
                  Navigator.pop(context); // Close the bottom sheet
                  final picker = ImagePicker();
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    final image = File(pickedFile.path);

                    viewModel.setProfileImage(image);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: context.mediaQueryHeight / 70),
      Consumer<EditProfileViewModel>(builder: (_, vm, __) {
        final image = vm.profileImage;

        return Row(
          children: [
            image != null
                ? CircleAvatar(
                    backgroundImage: FileImage(image),
                    radius: 25,
                  )
                : UserImageAvatarWidget(imageUrl: ''),
            SizedBox(width: context.mediaQueryWidth / 21),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Inayat',
                      style: Themetext.headline,
                    ),
                  ],
                ),
                SizedBox(height: context.mediaQueryHeight / 70),
                GestureDetector(
                  onTap: showImageSourceActionSheet,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.greyColor),
                    child: Text('Choose Image'),
                  ),
                )
              ],
            )
          ],
        );
      }),
    ],
  );
}
