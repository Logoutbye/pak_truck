import 'package:flutter/material.dart';
import 'package:testt/src/configs/app_constants.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/sell/widget/bottom_sheets.dart';
import 'package:testt/src/features/sell/widget/color_picker.dart';
import 'package:testt/src/features/sell/widget/sell_textform_field.dart';
import 'package:testt/src/features/sell/widget/sell_image_picker.dart';
import 'package:testt/src/features/sell/widget/sell_video_picker.dart';

class SellSparePartsScreen extends StatefulWidget {
  const SellSparePartsScreen({super.key});

  @override
  State<SellSparePartsScreen> createState() => _SellSparePartsScreenState();
}

class _SellSparePartsScreenState extends State<SellSparePartsScreen> {
  TextEditingController locationController = TextEditingController();
  TextEditingController registeredInController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController makeController = TextEditingController();
  TextEditingController colorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          buildSellImagePicker(context, 'Upload Photo'),
          SizedBox(height: context.mediaQueryHeight / 30),
          buildSellVideoPicker(context, 'Upload Video'),
          SizedBox(height: context.mediaQueryHeight / 100),
          Divider(),
          SizedBox(height: context.mediaQueryHeight / 80),
          Text('Truck information',
              style: Themetext.headline.copyWith(fontSize: 18)),
          SizedBox(height: context.mediaQueryHeight / 30),

          //  location
          SellTextFormField(
            titleText: 'Location',
            hintText: 'Enter Location',
            controller: locationController,
            leading: Image.asset('assets/images/location.png'),
            trailing: InkWell(
                onTap: () {
                  showSelectionModal(
                    context: context,
                    title: "Select Location",
                    hintText: 'Search by Location',
                    items: pakistanCities,
                    onItemSelected: (selectedItem) {
                      locationController.text = selectedItem;
                    },
                  );
                },
                child: Image.asset('assets/images/more.png')),
          ),
          //Registered in
          SellTextFormField(
            titleText: 'Registered In',
            hintText: 'Enter Registered In',
            controller: registeredInController,
            leading: Image.asset('assets/images/registered_in.png'),
            trailing: InkWell(
                onTap: () {
                  showSelectionModal(
                    context: context,
                    title: "Registered In",
                    hintText: 'Search by Registration Area',
                    items: pakistanProvinces,
                    onItemSelected: (selectedItem) {
                      registeredInController.text = selectedItem;
                    },
                  );
                },
                child: Image.asset('assets/images/more.png')),
          ),
          //Truck year
          SellTextFormField(
            titleText: 'Truck Year',
            hintText: 'Enter Truck Year',
            controller: yearController,
            leading: Image.asset('assets/images/truck.png'),
            trailing: InkWell(
                onTap: () {
                  showSelectionModal(
                    context: context,
                    title: "Truck Year",
                    hintText: 'Select By Year',
                    items: vehicleRegistrationYears,
                    onItemSelected: (selectedItem) {
                      yearController.text = selectedItem;
                    },
                  );
                },
                child: Image.asset('assets/images/more.png')),
          ),

          //Truck make
          SellTextFormField(
            titleText: 'Truck Make',
            hintText: 'Enter Make',
            controller: makeController,
            leading: Image.asset('assets/images/truck.png'),
            trailing: InkWell(
                onTap: () {
                  showSelectionModal(
                    context: context,
                    title: "Truck Make",
                    hintText: 'Select By Make',
                    items: carMakes,
                    onItemSelected: (selectedItem) {
                      makeController.text = selectedItem;
                    },
                  );
                },
                child: Image.asset('assets/images/more.png')),
          ),
          //Truck model
          SellTextFormField(
            titleText: 'Truck Model',
            hintText: 'Enter Model',
            controller: modelController,
            leading: Image.asset('assets/images/truck.png'),
            trailing: InkWell(
                onTap: () {
                  showSelectionModal(
                    context: context,
                    title: "Truck Model",
                    hintText: 'Select By Model',
                    items: carModels,
                    onItemSelected: (selectedItem) {
                      modelController.text = selectedItem;
                    },
                  );
                },
                child: Image.asset('assets/images/more.png')),
          ),
          // Your form with SellTextFormField
          SellTextFormField(
            titleText: 'Selected Color',
            hintText: 'Select a color',
            controller: colorController,
            leading: Icon(Icons.color_lens),
            trailing: ColorPickerWidget(colorController: colorController),
          ),
        ],
      ),
    );
  }
}
