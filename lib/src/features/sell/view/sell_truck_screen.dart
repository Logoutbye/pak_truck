import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/app_constants.dart';
import 'package:testt/src/configs/components/custom_back_button.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/sell/view/ad_posted_screen.dart';
import 'package:testt/src/features/sell/view_model/sell_truck_view_model.dart';
import 'package:testt/src/features/sell/widget/bottom_sheets.dart';
import 'package:testt/src/features/sell/widget/select_transmission_widget.dart';
import 'package:testt/src/features/sell/widget/sell_truck_media_picker.dart';
import 'package:testt/src/features/sell/widget/sell_textform_field.dart';
import '../widget/select_engine_type_widget.dart';

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
        leading: CustomBackButton(),
        title: Text('Sell your Truck'),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          buildMediaPicker(
              context, 'Upload Media', Provider.of<SellTuckViewModel>(context)),
          // buildSellImagePicker(
          //     context, 'Upload Photo', Provider.of<SellTuckViewModel>(context)),
          // SizedBox(height: context.mediaQueryHeight / 30),
          // buildSellVideoPicker(context, 'Upload Video'),
          // SizedBox(height: context.mediaQueryHeight / 20),
          SizedBox(height: context.mediaQueryHeight / 70),
          Text('Truck information', style: Themetext.superHeadline),
          SizedBox(height: context.mediaQueryHeight / 70),
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
          //  location
          SellTextformField(
            errorText: viewModel.fieldErrors['Location'],
            titleText: 'Location',
            hintText: 'Enter Location',
            controller: viewModel.locationController,
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
          //price
          SellTextformField(
            errorText: viewModel.fieldErrors['Price'],
            titleText: 'Price',
            hintText: 'Enter Price in PKR',
            controller: viewModel.priceController,
            leading: SvgPicture.asset('assets/svg/price.svg'),
          ),
          //Truck year
          SellTextformField(
            errorText: viewModel.fieldErrors['Truck Year'],
            titleText: 'Model Year',
            hintText: 'Enter Model Year',
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
          //Registered in
          SellTextformField(
            errorText: viewModel.fieldErrors['Registered In'],
            titleText: 'Registered In',
            hintText: 'Enter Registered In',
            controller: viewModel.registeredInController,
            leading: SvgPicture.asset('assets/svg/registered_in.svg'),
            // registered_in.svg
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
          //Truck make
          SellTextformField(
            errorText: viewModel.fieldErrors['Truck Make'],
            titleText: 'Truck Make',
            hintText: 'Enter Make',
            controller: viewModel.truckMakeController,
            leading: SvgPicture.asset(
              'assets/svg/cpu.svg',
              height: 19.h,
            ),
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
          // enigne type
          SelectEngineTypeWidget(),
          SizedBox(height: context.mediaQueryHeight / 50),
          // description
          SellTextformField(
            errorText: viewModel.fieldErrors['Description'],
            maxLines: 5,
            minLines: 4,
            titleText: ' Description',
            hintText: 'Enter Description',
            controller: viewModel.descriptionController,
          ),
          SelectTransmissionWidget(),
          SizedBox(height: context.mediaQueryHeight / 50),
          // submit button
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
