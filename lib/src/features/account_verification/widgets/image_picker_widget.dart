import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';

import '../view_model/verify_shop_view_model.dart';

Widget buildImagePicker(BuildContext context, String label, bool isFront) {
  final viewModel = Provider.of<VerifyShopViewModel>(context, listen: false);

  Future<void> _showImageSourceActionSheet() async {
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
                    isFront
                        ? viewModel.setFrontImage(image)
                        : viewModel.setBackImage(image);
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
                    isFront
                        ? viewModel.setFrontImage(image)
                        : viewModel.setBackImage(image);
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
      Text(label),
      SizedBox(height: context.mediaQueryHeight / 70),
      GestureDetector(
        onTap: _showImageSourceActionSheet,
        child: Consumer<VerifyShopViewModel>(
          builder: (_, vm, __) {
            final image = isFront ? vm.frontImage : vm.backImage;
            return DottedBorder(
              dashPattern: const <double>[10, 5],
              color: AppColors.primaryColor,
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(6),
              child: SizedBox(
                height: context.mediaQueryHeight / 6,
                width: double.infinity,
                child: image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt,
                              color: AppColors.primaryColor, size: 40),
                          SizedBox(height: 8),
                          Text(
                            'Add Photo',
                            style: TextStyle(
                                color: AppColors.primaryColor, fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'PDF, JPG, JPEG, PNG less than 10MB.',
                            style:
                                TextStyle(color: AppColors.grey, fontSize: 15),
                          ),
                        ],
                      ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
