import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/app_constants.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/sell/view_model/sell_view_model.dart';
import 'package:testt/src/features/sell/widget/bottom_sheets.dart';
import 'package:testt/src/features/sell/widget/color_picker.dart';
import 'package:testt/src/features/sell/widget/sell_textform_field.dart';
import 'package:testt/src/features/sell/widget/sell_image_picker.dart';
import 'package:testt/src/features/sell/widget/sell_video_picker.dart';

import '../widget/select_transmission_type_widget.dart';

class SellTruckScreen extends StatefulWidget {
  const SellTruckScreen({super.key});

  @override
  State<SellTruckScreen> createState() => _SellTruckScreenState();
}

class _SellTruckScreenState extends State<SellTruckScreen> {
  TextEditingController locationController = TextEditingController();
  TextEditingController cateogryController = TextEditingController();
  TextEditingController registeredInController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController makeController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController engineTypeController = TextEditingController();
  TextEditingController engineMillageController = TextEditingController();
  TextEditingController engineCapacityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        title: InkWell(
          onTap: () {},
          child: Text(
            'Sell your Truck',
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
          //  category
          SellTextFormField(
            titleText: 'Category',
            hintText: 'Select Category',
            controller: cateogryController,
            leading: Image.asset('assets/images/truck.png'),
            trailing: InkWell(
              onTap: () {
                // Call the reusable bottom sheet
                showDynamicCategoryModal(
                  context: context,
                  title: "Select Category",
                  data: categoriesList,
                  onItemSelected: (selectedItem) {
                    cateogryController.text = selectedItem;
                  },
                );
              },
              child: Image.asset('assets/images/more.png'),
            ),
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
          // Color plate
          SellTextFormField(
            titleText: 'Selected Color',
            hintText: 'Select a color',
            controller: colorController,
            leading: Icon(Icons.color_lens),
            trailing: ColorPickerWidget(colorController: colorController),
          ),

          // engine type
          SellTextFormField(
              titleText: 'Engine Type',
              hintText: 'Select Engine Type',
              controller: engineTypeController,
              leading: Image.asset('assets/images/engine.png'),
              trailing: InkWell(
                  onTap: () {
                    showSelectionModal(
                      context: context,
                      title: 'Engine Type',
                      hintText: 'Select Engine Type',
                      items: truckEngines,
                      onItemSelected: (selectedItem) {
                        engineTypeController.text = selectedItem;
                      },
                    );
                  },
                  child: Image.asset('assets/images/more.png'))),

          // engine Capacity
          SellTextFormField(
              titleText: 'Engine Capacity',
              hintText: 'Select Engine Capacity',
              controller: engineCapacityController,
              leading: Image.asset('assets/images/engine.png'),
              trailing: InkWell(
                  onTap: () {
                    showSelectionModal(
                      context: context,
                      title: 'Engine Capacity',
                      hintText: 'Select Engine Capacity',
                      items: truckCapacities,
                      onItemSelected: (selectedItem) {
                        engineCapacityController.text = selectedItem;
                      },
                    );
                  },
                  child: Image.asset('assets/images/more.png'))),

          // engine Mileage
          SellTextFormField(
              titleText: 'Engine Mileage',
              hintText: 'Select Engine Mileage',
              controller: engineMillageController,
              leading: Image.asset('assets/images/engine.png'),
              trailing: InkWell(
                  onTap: () {
                    showSelectionModal(
                      context: context,
                      title: 'Engine Mileage',
                      hintText: 'Select Engine Mileage',
                      items: truckMileages,
                      onItemSelected: (selectedItem) {
                        engineMillageController.text = selectedItem;
                      },
                    );
                  },
                  child: Image.asset('assets/images/more.png'))),
          // description
          SellTextFormField(
            titleText: ' Description',
            hintText: 'Enter Description',
            controller: descriptionController,
            leading: Image.asset('assets/images/description.png'),
          ),

          SelectTransmissionTypeWidget(),
        ],
      ),
    );
  }
}



