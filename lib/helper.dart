import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/features/account_verification/view_model/verify_shop_view_model.dart';

class VerifyShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<VerifyShopViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Verification Process'),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          _buildField(
              'Shop Name', 'Enter your shop name', viewModel.shopNameController),
          _buildField('Shop Address', 'Enter your shop address',
              viewModel.shopAddressController),
          _buildField('Email Address', 'Enter your email address',
              viewModel.emailAddressController),
          _buildField('Phone Number', 'Enter your phone number',
              viewModel.phoneNoController),
          _buildImagePicker(context, 'Upload Front Photo', true),
          _buildImagePicker(context, 'Upload Back Photo', false),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: viewModel.clearAll,
                child: Text('Clear All'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (viewModel.validateInputs(context)) {
                    print('Submitting data...');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildField(
      String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          controller: controller,
          decoration: InputDecoration(hintText: hint),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildImagePicker(BuildContext context, String label, bool isFront) {
    final viewModel = Provider.of<VerifyShopViewModel>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        GestureDetector(
          onTap: () async {
            final picker = ImagePicker();
            final pickedFile = await picker.pickImage(source: ImageSource.gallery);
            if (pickedFile != null) {
              final image = File(pickedFile.path);
              isFront
                  ? viewModel.setFrontImage(image)
                  : viewModel.setBackImage(image);
            }
          },
          child: Consumer<VerifyShopViewModel>(
            builder: (_, vm, __) {
              final image = isFront ? vm.frontImage : vm.backImage;
              return Container(
                height: 100,
                width: 100,
                color: Colors.grey[200],
                child: image != null
                    ? Image.file(image, fit: BoxFit.cover)
                    : Icon(Icons.camera_alt),
              );
            },
          ),
        ),
      ],
    );
  }


}
