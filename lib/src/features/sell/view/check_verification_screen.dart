import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/data/response/status.dart';
import 'package:testt/src/features/account_verification/view_model/verify_shop_view_model.dart';
import 'package:testt/src/features/dashborad/widgets/what_do_you_want_to_sell_bottom_sheet.dart';
import 'package:testt/src/features/my_profile/view_model/my_profile_view_model.dart';

class CheckVerificationScreen extends StatefulWidget {
  const CheckVerificationScreen({super.key});

  @override
  _CheckVerificationScreenState createState() =>
      _CheckVerificationScreenState();
}

class _CheckVerificationScreenState extends State<CheckVerificationScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch verification status when the screen loads
    Future.microtask(() => Provider.of<ProfileViewModel>(context, listen: false)
        .checkVerificationApi());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Account Verification")),
      body: Consumer<ProfileViewModel>(
        builder: (context, profileVM, child) {
          final verificationStatus = profileVM.verificationStatus;

          if (verificationStatus.status == Status.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (verificationStatus.status == Status.error) {
            return Center(child: Text("Error: ${verificationStatus.message}"));
          } else if (verificationStatus.status == Status.completed) {
            final data =
                verificationStatus.data!.data; // Extract verification data
            // ✅ NAVIGATION LOGIC
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (data?.isAccountModeVerified ?? false) {
                whatDoYouWantToSellBottomSheet(context);
              }
            });
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Verification Status: ${data!.isAccountModeVerified ? "Verified" : "Not Verified"}"),
                  Text("Account Mode: ${data.accountMode}"),
                  if (data.shopCategory.isNotEmpty)
                    Text("Shop Category: ${data.shopCategory}"),
                  SizedBox(height: 30.sp),
                  RoundButton(
                      width: context.mediaQueryWidth / 2.5,
                      title: 'Verify Now',
                      onPress: () {
                        if (data.accountMode == 'shop') {
                          final verifyShopViewModel =
                              Provider.of<VerifyShopViewModel>(context,
                                  listen: false);

                          Future.microtask(() {
                            // Retrieve profile data from SessionController (local storage)
                            verifyShopViewModel.setProfileDataFromSession();
                          });
                          Navigator.pushNamed(
                              context, RoutesName.verifyShopScreen);
                        } else {
                          Navigator.pushNamed(
                              context, RoutesName.verifyIndividualScreen);
                        }
                      }),
                  SizedBox(height: 30.sp),
                  RoundButton(
                      color: AppColors.primaryLight4,
                      textColor: AppColors.primary,
                      width: context.mediaQueryWidth / 2.5,
                      title: 'Home',
                      onPress: () {
                        Navigator.pop(context);
                      })
                ],
              ),
            );
          } else {
            return Center(
                child: Text("Press the button to check verification"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ProfileViewModel>(context, listen: false)
              .checkVerificationApi();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
