import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/sell/view_model/sell_truck_view_model.dart';

Widget buildSellImagePicker(BuildContext context, String label, viewModel) {
  Future<void> showImageSourceActionSheet() async {
    showModalBottomSheet(
      context: context,
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
                  Navigator.pop(context);
                  final picker = ImagePicker();
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    viewModel.addImage(File(pickedFile.path));
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                titleTextStyle: Themetext.blackBoldText,
                onTap: () async {
                  Navigator.pop(context);
                  final picker = ImagePicker();
                  final pickedFiles = await picker.pickMultiImage();
                  if (pickedFiles.isNotEmpty) {
                    for (var file in pickedFiles) {
                      viewModel.addImage(File(file.path));
                    }
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
      Text(
        label,
        style: Themetext.headline.copyWith(fontSize: 16),
      ),
      SizedBox(height: context.mediaQueryHeight / 70),

      // Conditionally show "Add Photo" section
      if (viewModel.images.isEmpty)
        GestureDetector(
          onTap: showImageSourceActionSheet,
          child: DottedBorder(
            dashPattern: const <double>[10, 5],
            color: AppColors.primaryColor,
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.all(6),
            child: SizedBox(
              height: context.mediaQueryHeight / 6,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt,
                      color: AppColors.primaryColor, size: 40),
                  SizedBox(height: 8),
                  Text(
                    'Add Photo',
                    style:
                        TextStyle(color: AppColors.primaryColor, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'PDF, JPG, JPEG, PNG less than 10MB.',
                    style: TextStyle(color: AppColors.grey, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),

      // Display Selected Images
      SizedBox(height: 16),
      if (viewModel.images.isNotEmpty)
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(viewModel.images.length, (index) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                    image: DecorationImage(
                      image: FileImage(viewModel.images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: -8,
                  right: -8,
                  child: GestureDetector(
                    onTap: () => viewModel.removeImage(index),
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.close, color: Colors.white, size: 14),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),

      // Add More Button
      if (viewModel.images.isNotEmpty)
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: context.mediaQueryWidth / 1.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('If you want you can add more'),
                TextButton.icon(
                  onPressed: showImageSourceActionSheet,
                  icon: Icon(Icons.add_a_photo, color: AppColors.primaryColor),
                  label: Text('Add more',
                      style: TextStyle(color: AppColors.primaryColor)),
                ),
              ],
            ),
          ),
        ),
    ],
  );
}
