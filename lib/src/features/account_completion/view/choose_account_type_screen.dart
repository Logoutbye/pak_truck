import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/configs/components/custom_appbar.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/account_completion/view_model/complete_account_view_model.dart';

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
                        activeColor: AppColors.primary,
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
                              ? AppColors.primary
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
                        activeColor: AppColors.primary,
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
                              ? AppColors.primary
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
                          activeColor: AppColors.primary,
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
                                ? AppColors.primary
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
                          activeColor: AppColors.primary,
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
                                ? AppColors.primary
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
                          value: "Store",
                          groupValue: _shopType,
                          activeColor: AppColors.primary,
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
                            _shopType = "Store";
                          });
                        },
                        child: Text(
                          "Auto Store",
                          style: TextStyle(
                            fontSize: 18,
                            color: _shopType == "Store"
                                ? AppColors.primary
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
                Consumer<CompleteAccountViewModel>(
                  builder: (BuildContext context,
                      CompleteAccountViewModel value, Widget? child) {
                    return RoundButton(
                      loading: value.loading,
                      title: _accountType == "Individual"
                          ? "Next"
                          : _shopType == null
                              ? "Select Shop Type"
                              : "Verify Your Shop",
                      onPress: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        String? userId = prefs.getString('user_id');


                        if (_accountType == "Individual") {
                          value.setUserRole(_accountType.toLowerCase());
                          value.selectAccountMode(
                            context,
                            true,
                            userId.toString(),
                          );
                        } else if (_accountType == "Shop" &&  _shopType != null) {
                          value.setUserRoleAndType(_accountType.toLowerCase(),
                              _shopType?.toLowerCase() ?? 'Not defined');

                          value.selectAccountMode(
                              context, false, userId.toString());
                        } else {
                          Utils.flushBarErrorMessage(
                              'Please select a shop type.', context);
                        }
                      },
                    );
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
