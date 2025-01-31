import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/app_constants.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/custom_back_button.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/sell/view_model/sell_spare_parts_view_model.dart';
import 'package:testt/src/features/sell/widget/bottom_sheets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testt/src/features/sell/widget/sell_spareparts_media_picker.dart';
import 'package:testt/src/features/sell/widget/sell_textform_field.dart';

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
        leading: CustomBackButton(),
        title: InkWell(
          onTap: () {},
          child: Text(
            'Sell Spare Parts',
            style: TextStyle(color: AppColors.black),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          buildSparePartsMediaPicker(context, 'Upload File',
              Provider.of<SellSparePartsViewModel>(context)),
          SizedBox(height: context.mediaQueryHeight / 70),
          Text('Spare parts information', style: Themetext.superHeadline),
          //  category
          SellTextformField(
            errorText: viewModel.fieldErrors['Category'],
            titleText: 'Category',
            hintText: 'Select Category',
            controller: viewModel.cateogryController,
            leading: SvgPicture.asset(
              'assets/svg/truck_im.svg',
              height: 18.h,
            ),
            trailing: InkWell(
              onTap: () {
                showSelectionModal(
                  context: context,
                  title: "Select Category",
                  hintText: 'Search by Category',
                  items: sparePartsCategories,
                  onItemSelected: (selectedItem) {
                    viewModel.cateogryController.text = selectedItem;
                  },
                );
              },
              child: Image.asset('assets/images/more.png'),
            ),
          ),

          //  location
          SellTextformField(
            errorText: viewModel.fieldErrors['Location'],
            titleText: 'Location',
            hintText: 'Enter Location',
            controller: viewModel.locationController,
            // leading: Image.asset('assets/images/location.png'),

            leading: SvgPicture.asset(
              'assets/svg/location.svg',
              height: 18.h,
            ),
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
          //  price
          SellTextformField(
            errorText: viewModel.fieldErrors['Price'],
            titleText: 'Price',
            hintText: 'Enter Price in PKR',
            controller: viewModel.priceController,
            leading: SvgPicture.asset(
              'assets/svg/price.svg',
              height: 18.h,
            ),
          ),
          //  conditon
          SellTextformField(
            errorText: viewModel.fieldErrors['Condition'],
            titleText: 'Condition',
            hintText: 'Enter Condition',
            controller: viewModel.conditionController,
            leading: SvgPicture.asset(
              'assets/svg/condition.svg',
              height: 18.h,
            ),
            trailing: InkWell(
                onTap: () {
                  showSelectionModal(
                    context: context,
                    title: "Select Condition",
                    hintText: 'Search by Condition',
                    items: ['New', 'Used'],
                    onItemSelected: (selectedItem) {
                      viewModel.conditionController.text = selectedItem;
                    },
                  );
                },
                child: Image.asset('assets/images/more.png')),
          ),
          // description
          SellTextformField(
            leading: SizedBox(
              height: 18.h,
            ),
            errorText: viewModel.fieldErrors['Description'],
            maxLines: 5,
            minLines: 4,
            titleText: ' Description',
            hintText: 'Enter Description',
            controller: viewModel.descriptionController,
          ),
          SizedBox(height: context.mediaQueryHeight / 20),
          // submit button
          RoundButton(
            loading: viewModel.loading,
              title: 'Submit & Continue',
              onPress: () {
                if (viewModel.validateSellTruckFields(context)) {
                  viewModel.submitData(context);
                }
              }),
          SizedBox(height: context.mediaQueryHeight / 20),
        ],
      ),
    );
  }
}
