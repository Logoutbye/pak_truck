import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/app_constants.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/sell/view/ad_posted_screen.dart';
import 'package:testt/src/features/sell/view_model/sell_truck_view_model.dart';
import 'package:testt/src/features/sell/widget/allow_contact_on_whatsapp_widget.dart';
import 'package:testt/src/features/sell/widget/bottom_sheets.dart';
import 'package:testt/src/features/sell/widget/color_picker.dart';
import 'package:testt/src/features/sell/widget/select_truck_features_widget.dart';
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
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<SellTuckViewModel>(context);
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
          buildSellImagePicker(
              context, 'Upload Photo', Provider.of<SellTuckViewModel>(context)),
          SizedBox(height: context.mediaQueryHeight / 30),
          buildSellVideoPicker(context, 'Upload Video'),
          SizedBox(height: context.mediaQueryHeight / 100),
          Divider(),
          SizedBox(height: context.mediaQueryHeight / 80),
          Text('Truck information', style: Themetext.superHeadline),

          SizedBox(height: context.mediaQueryHeight / 30),
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

          //  category
          SellTextFormField(
            errorText: viewModel.fieldErrors['Category'],
            titleText: 'Category',
            hintText: 'Select Category',
            controller: viewModel.cateogryController,
            leading: Image.asset('assets/images/truck.png'),
            trailing: InkWell(
              onTap: () {
                // Call the reusable bottom sheet
                showDynamicCategoryModal(
                  context: context,
                  title: "Select Category",
                  data: categoriesList,
                  onItemSelected: (selectedItem) {
                    viewModel.cateogryController.text = selectedItem;
                  },
                );
              },
              child: Image.asset('assets/images/more.png'),
            ),
          ),

          //Registered in
          SellTextFormField(
            errorText: viewModel.fieldErrors['Registered In'],
            titleText: 'Registered In',
            hintText: 'Enter Registered In',
            controller: viewModel.registeredInController,
            leading: Image.asset('assets/images/registered_in.png'),
            trailing: InkWell(
                onTap: () {
                  showSelectionModal(
                    context: context,
                    title: "Registered In",
                    hintText: 'Search by Registration Area',
                    items: pakistanProvinces,
                    onItemSelected: (selectedItem) {
                      viewModel.registeredInController.text = selectedItem;
                    },
                  );
                },
                child: Image.asset('assets/images/more.png')),
          ),

          //Truck year
          SellTextFormField(
            errorText: viewModel.fieldErrors['Truck Year'],
            titleText: 'Truck Year',
            hintText: 'Enter Truck Year',
            controller: viewModel.yearController,
            leading: SvgPicture.asset('assets/svg/calender.svg'),
            // leading: Image.asset('assets/images/calender.png'),
            trailing: InkWell(
                onTap: () {
                  showSelectionModal(
                    context: context,
                    title: "Truck Year",
                    hintText: 'Select By Year',
                    items: vehicleRegistrationYears,
                    onItemSelected: (selectedItem) {
                      viewModel.yearController.text = selectedItem;
                    },
                  );
                },
                child: Image.asset('assets/images/more.png')),
          ),

          //Truck make
          SellTextFormField(
            errorText: viewModel.fieldErrors['Truck Make'],
            titleText: 'Truck Make',
            hintText: 'Enter Make',
            controller: viewModel.truckMakeController,
            leading: Image.asset('assets/images/make.png'),
            trailing: InkWell(
                onTap: () {
                  showSelectionModal(
                    context: context,
                    title: "Truck Make",
                    hintText: 'Select By Make',
                    items: carMakes,
                    onItemSelected: (selectedItem) {
                      viewModel.truckMakeController.text = selectedItem;
                    },
                  );
                },
                child: Image.asset('assets/images/more.png')),
          ),

          //Truck model
          SellTextFormField(
            errorText: viewModel.fieldErrors['Truck Model'],
            titleText: 'Truck Model',
            hintText: 'Enter Model',
            controller: viewModel.truckModelController,
            leading: Image.asset('assets/images/model.png'),
            trailing: InkWell(
                onTap: () {
                  showSelectionModal(
                    context: context,
                    title: "Truck Model",
                    hintText: 'Select By Model',
                    items: carModels,
                    onItemSelected: (selectedItem) {
                      viewModel.truckModelController.text = selectedItem;
                    },
                  );
                },
                child: Image.asset('assets/images/more.png')),
          ),

          // Color plate
          SellTextFormField(
            errorText: viewModel.fieldErrors['Color'],
            titleText: 'Selected Color',
            hintText: 'Select a color',
            controller: viewModel.colorController,
            leading: Image.asset('assets/images/color.png'),
            trailing:
                ColorPickerWidget(colorController: viewModel.colorController),
          ),

          // engine type
          SellTextFormField(
              errorText: viewModel.fieldErrors['Engine Type'],
              titleText: 'Engine Type',
              hintText: 'Select Engine Type',
              controller: viewModel.engineTypeController,
              leading: Image.asset('assets/images/engine_type.png'),
              trailing: InkWell(
                  onTap: () {
                    showSelectionModal(
                      context: context,
                      title: 'Engine Type',
                      hintText: 'Select Engine Type',
                      items: truckEngines,
                      onItemSelected: (selectedItem) {
                        viewModel.engineTypeController.text = selectedItem;
                      },
                    );
                  },
                  child: Image.asset('assets/images/more.png'))),

          // engine Capacity
          SellTextFormField(
              errorText: viewModel.fieldErrors['Engine Capacity'],
              titleText: 'Engine Capacity',
              hintText: 'Select Engine Capacity',
              controller: viewModel.engineCapacityController,
              leading: Image.asset('assets/images/engine.png'),
              trailing: InkWell(
                  onTap: () {
                    showSelectionModal(
                      context: context,
                      title: 'Engine Capacity',
                      hintText: 'Select Engine Capacity',
                      items: truckCapacities,
                      onItemSelected: (selectedItem) {
                        viewModel.engineCapacityController.text = selectedItem;
                      },
                    );
                  },
                  child: Image.asset('assets/images/more.png'))),

          // engine Mileage
          SellTextFormField(
              errorText: viewModel.fieldErrors['Engine Mileage'],
              titleText: 'Engine Mileage',
              hintText: 'Select Engine Mileage',
              controller: viewModel.engineMillageController,
              leading: Image.asset('assets/images/milleage.png'),
              trailing: InkWell(
                  onTap: () {
                    showSelectionModal(
                      context: context,
                      title: 'Engine Mileage',
                      hintText: 'Select Engine Mileage',
                      items: truckMileages,
                      onItemSelected: (selectedItem) {
                        viewModel.engineMillageController.text = selectedItem;
                      },
                    );
                  },
                  child: Image.asset('assets/images/more.png'))),

          // Truck Assembly
          SellTextFormField(
              errorText: viewModel.fieldErrors['Truck Assembly'],
              titleText: 'Truck Assembly',
              hintText: 'Select Truck Assembly',
              controller: viewModel.truckAssemblyController,
              leading: Image.asset('assets/images/milleage.png'),
              trailing: InkWell(
                  onTap: () {
                    showSelectionModal(
                      context: context,
                      title: 'Truck Assembly',
                      hintText: 'Select Truck Assembly',
                      items: truckAssembly,
                      onItemSelected: (selectedItem) {
                        viewModel.truckAssemblyController.text = selectedItem;
                      },
                    );
                  },
                  child: Image.asset('assets/images/more.png'))),

          // description
          SellTextFormField(
            errorText: viewModel.fieldErrors['Description'],
            maxLines: 2,
            minLines: 2,
            titleText: ' Description',
            hintText: 'Enter Description',
            controller: viewModel.descriptionController,
          ),

          SelectTransmissionTypeWidget(),

          SelectTruckFeaturesWidget(),

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
          Consumer<SellTuckViewModel>(
            builder:
                (BuildContext context, SellTuckViewModel value, Widget? child) {
              return RoundButton(
                  loading: value.loading,
                  title: 'Submit & Continue',
                  onPress: () {
                    // if (viewModel.validateSellTruckFields(context)) {
                    viewModel.submitData(context).then((_) {
                      Utils.snackBar('Form submitted successfully!', context);
                      Navigator.push(
                          context,
                          SlideTransitionPage(
                              slideDirection: SlideDirection.top,
                              page: PostedSuccessScreen()));
                    }).onError((e, s) {
                      Utils.flushBarErrorMessage(
                          'Some thing went wrong please try again', context);
                    });
                    // }
                  });
            },
          ),
          SizedBox(height: context.mediaQueryHeight / 20),
        ],
      ),
    );
  }
}
