import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';

class ImagePickerWidget extends StatefulWidget {
  final String label;
  final Function(File?) onImagePicked;

  const ImagePickerWidget({
    Key? key,
    required this.label,
    required this.onImagePicked,
  }) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _pickedImage;

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
                title: Text('Upload Photos'),
                titleTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildOptionTile(
                icon: Icons.camera_alt,
                text: 'Take a Photo',
                onTap: () => _pickImage(ImageSource.camera),
              ),
              _buildOptionTile(
                icon: Icons.photo_library,
                text: 'Choose from Gallery',
                onTap: () => _pickImage(ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );
  }

  ListTile _buildOptionTile({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      onTap: () {
        Navigator.pop(context); // Close the bottom sheet
        onTap();
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
      widget.onImagePicked(_pickedImage);
    }
  }

  void _removeImage() {
    setState(() {
      _pickedImage = null;
    });
    widget.onImagePicked(null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        SizedBox(height: context.mediaQueryHeight / 70),
        GestureDetector(
          onTap: _showImageSourceActionSheet,
          child: DottedBorder(
            dashPattern: const <double>[10, 5],
            color: AppColors.primary,
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.all(6),
            child: Stack(
              children: [
                SizedBox(
                  height: context.mediaQueryHeight / 6,
                  width: double.infinity,
                  child: _pickedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            _pickedImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt,
                                color: AppColors.primary, size: 40),
                            SizedBox(height: 8),
                            Text(
                              'Add Photo',
                              style: TextStyle(
                                  color: AppColors.primary, fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'PDF, JPG, JPEG, PNG less than 10MB.',
                              style: TextStyle(
                                  color: AppColors.grey, fontSize: 15),
                            ),
                          ],
                        ),
                ),
                if (_pickedImage != null)
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: _removeImage,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}