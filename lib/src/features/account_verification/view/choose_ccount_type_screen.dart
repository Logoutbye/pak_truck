import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/configs/components/custom_appbar.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/account_verification/view/verify_individual_screen.dart';
import 'package:testt/src/features/account_verification/view_model/verify_individual_view_model.dart';
import 'package:testt/src/features/account_verification/view_model/verify_shop_view_model.dart';

class ChooseAccountTypeScreen extends StatefulWidget {
  const ChooseAccountTypeScreen({super.key});

  @override
  _ChooseAccountTypeScreenState createState() =>
      _ChooseAccountTypeScreenState();
}

class _ChooseAccountTypeScreenState extends State<ChooseAccountTypeScreen> {
  String _accountType = "Individual"; // Default selection
  String?
      _shopType; // Secondary selection for "Shop" (can be "Factory", "Shop", or "Showroom")

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: const SizedBox(),
        firstText: 'Choose',
        secondText: '',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose your Role:",
                  style: Themetext.headline,
                ),
                const SizedBox(height: 16),
                // Individual selection
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Radio<String>(
                        value: "Individual",
                        groupValue: _accountType,
                        activeColor: AppColors.primaryColor,
                        onChanged: (value) {
                          setState(() {
                            _accountType = value!;
                            _shopType =
                                null; // Reset shop type when switching to individual
                          });
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _accountType = "Individual";
                          _shopType = null; // Reset shop type
                        });
                      },
                      child: Text(
                        "Individual",
                        style: TextStyle(
                          fontSize: 18,
                          color: _accountType == "Individual"
                              ? AppColors.primaryColor
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                // Shop selection
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Radio<String>(
                        value: "Shop",
                        groupValue: _accountType,
                        activeColor: AppColors.primaryColor,
                        onChanged: (value) {
                          setState(() {
                            _accountType = value!;
                            _shopType = null; // Reset shop type
                          });
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _accountType = "Shop";
                          _shopType = null; // Reset shop type
                        });
                      },
                      child: Text(
                        "Shop",
                        style: TextStyle(
                          fontSize: 18,
                          color: _accountType == "Shop"
                              ? AppColors.primaryColor
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                // If "Shop" is selected, show the secondary options
                if (_accountType == "Shop") ...[
                  const SizedBox(height: 16),
                  Text(
                    "Choose your Shop Type:",
                    style: Themetext.headline,
                  ),
                  const SizedBox(height: 16),
                  // Factory, Shop, or Showroom options
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Radio<String>(
                          value: "Factory",
                          groupValue: _shopType,
                          activeColor: AppColors.primaryColor,
                          onChanged: (value) {
                            setState(() {
                              _shopType = value!;
                            });
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _shopType = "Factory";
                          });
                        },
                        child: Text(
                          "Factory",
                          style: TextStyle(
                            fontSize: 18,
                            color: _shopType == "Factory"
                                ? AppColors.primaryColor
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Radio<String>(
                          value: "Showroom",
                          groupValue: _shopType,
                          activeColor: AppColors.primaryColor,
                          onChanged: (value) {
                            setState(() {
                              _shopType = value!;
                            });
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _shopType = "Showroom";
                          });
                        },
                        child: Text(
                          "Showroom",
                          style: TextStyle(
                            fontSize: 18,
                            color: _shopType == "Showroom"
                                ? AppColors.primaryColor
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Radio<String>(
                          value: "Shop",
                          groupValue: _shopType,
                          activeColor: AppColors.primaryColor,
                          onChanged: (value) {
                            setState(() {
                              _shopType = value!;
                            });
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _shopType = "Shop";
                          });
                        },
                        child: Text(
                          "Shop",
                          style: TextStyle(
                            fontSize: 18,
                            color: _shopType == "Shop"
                                ? AppColors.primaryColor
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
            Column(
              children: [
                RoundButton(
                  title: _accountType == "Individual"
                      ? "Next"
                      : _shopType == null
                          ? "Select Shop Type"
                          : "Verify Your Shop",
                  onPress: () {
                    if (_accountType == "Individual") {
                      context
                          .read<VerifyIndividualViewModel>()
                          .setUserRole(_accountType.toLowerCase());

                      Navigator.pushNamed(
                          context, RoutesName.verifyIndividualScreen);
                    } else if (_accountType == "Shop" && _shopType != null) {
                      context.read<VerifyShopViewModel>().setUserRoleAndType(
                          _accountType.toLowerCase(),
                          _shopType?.toLowerCase() ?? 'Not defined');
                      Navigator.pushNamed(
                        context,
                        RoutesName.verifyShopScreen,
                      );
                    } else {
                      Utils.flushBarErrorMessage(
                          'Please select a shop type.', context);
                    }
                  },
                ),
                SizedBox(height: context.mediaQueryHeight / 35),
              ],
            )
          ],
        ),
      ),
    );
  }
}
