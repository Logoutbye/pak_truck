import 'package:flutter/material.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/configs/components/custom_appbar.dart';

class ChooseAccountTypeScreen extends StatefulWidget {
  const ChooseAccountTypeScreen({super.key});

  @override
  _ChooseAccountTypeScreenState createState() =>
      _ChooseAccountTypeScreenState();
}

class _ChooseAccountTypeScreenState extends State<ChooseAccountTypeScreen> {
  String _accountType = "Individual"; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leading: const SizedBox(), firstText: 'Choose', secondText: ''),
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
                          });
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _accountType = "Individual";
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
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5, // Scale the size of the radio button
                      child: Radio<String>(
                        value: "Shop",
                        groupValue: _accountType,
                        activeColor: AppColors.primaryColor,
                        onChanged: (value) {
                          setState(() {
                            _accountType = value!;
                          });
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _accountType = "Shop";
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
              ],
            ),
            Column(
              children: [
                RoundButton(
                  title: _accountType == "Individual"
                      ? "Next"
                      : "Verify Your Shop",
                  onPress: () {
                    if (_accountType == "Individual") {
                      Navigator.pushNamed(context, RoutesName.homeScreen);
                    } else {
                      Navigator.pushNamed(context, RoutesName.verifyShopScreen);
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
