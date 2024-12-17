import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/app_constants.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/sell/view_model/sell_spare_parts_view_model.dart';
import 'package:testt/src/features/sell/widget/allow_contact_on_whatsapp_widget.dart';
import 'package:testt/src/features/sell/widget/bottom_sheets.dart';
import 'package:testt/src/features/sell/widget/sell_textform_field.dart';
import 'package:testt/src/features/sell/widget/sell_image_picker.dart';

class SellSparePartsScreen extends StatefulWidget {
  const SellSparePartsScreen({super.key});

  @override
  State<SellSparePartsScreen> createState() => _SellSparePartsScreenState();
}

class _SellSparePartsScreenState extends State<SellSparePartsScreen> {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<SellSparePartsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        title: InkWell(
          onTap: () {},
          child: Text(
            'Sell Spare Parts',
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          buildSellImagePicker(context, 'Upload Photo',
              Provider.of<SellSparePartsViewModel>(context)),

          SizedBox(height: context.mediaQueryHeight / 20),
          Text('Spare parts information', style: Themetext.superHeadline),

          SizedBox(height: context.mediaQueryHeight / 30),

          //  location
          SellTextFormField(
            errorText: viewModel.fieldErrors['Price'],
            titleText: 'Price',
            hintText: 'Enter Price in PKR',
            controller: viewModel.priceController,
            leading: Image.asset('assets/images/price.png'),
          ),

          //  location
          SellTextFormField(
            errorText: viewModel.fieldErrors['Location'],
            titleText: 'Location',
            hintText: 'Enter Location',
            controller: viewModel.locationController,
            leading: Image.asset('assets/images/location.png'),
            trailing: InkWell(
                onTap: () {
                  showSelectionModal(
                    context: context,
                    title: "Select Location",
                    hintText: 'Search by Location',
                    items: pakistanCities,
                    onItemSelected: (selectedItem) {
                      viewModel.locationController.text = selectedItem;
                    },
                  );
                },
                child: Image.asset('assets/images/more.png')),
          ),
          // title
          SellTextFormField(
            errorText: viewModel.fieldErrors['Title'],
            titleText: ' Title',
            hintText: 'Enter Title',
            controller: viewModel.titleController,
          ),

          // description
          SellTextFormField(
            errorText: viewModel.fieldErrors['Description'],
            maxLines: 2,
            minLines: 2,
            titleText: ' Description',
            hintText: 'Enter Description',
            controller: viewModel.descriptionController,
          ),

          SizedBox(height: context.mediaQueryHeight / 30),

          // contact form
          Text('Contact Information', style: Themetext.superHeadline),
          SizedBox(height: context.mediaQueryHeight / 35),
          SellTextFormField(
            errorText: viewModel.fieldErrors['Name'],
            titleText: 'Your Name',
            hintText: 'Enter your Name',
            controller: viewModel.sellerNameController,
          ),
          SellTextFormField(
            errorText: viewModel.fieldErrors['Mobile Number'],
            titleText: 'Your Mobile Number',
            hintText: 'Enter your Mobile Number',
            controller: viewModel.sellerMobileController,
          ),
          SellTextFormField(
            errorText: viewModel.fieldErrors['Address'],
            titleText: 'Your Address',
            hintText: 'Enter your Address',
            controller: viewModel.selllerAddressController,
          ),
          SellTextFormField(
            maxLines: 2,
            minLines: 2,
            titleText: 'Your Comments',
            hintText: 'Enter any other details',
            controller: viewModel.sellerCommentController,
          ),
          AllowWhatsappContactWidget(),
          SizedBox(height: context.mediaQueryHeight / 20),
          RoundButton(
              title: 'Submit & Continue',
              onPress: () {
                if (viewModel.validateSellTruckFields(context)) {
                  Utils.snackBar('Form submitted successfully!', context);
                }
              }),
          SizedBox(height: context.mediaQueryHeight / 20),
        ],
      ),
    );
  }
}
