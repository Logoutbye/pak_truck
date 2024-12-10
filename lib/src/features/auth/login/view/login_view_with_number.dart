import 'package:flutter/material.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/features/auth/widgets/country_picker_textfiled.dart';
import 'package:testt/src/features/auth/widgets/on_boarding_appbar.dart';
import '../../../../configs/extensions.dart';
import '../../../../configs/theme/theme_text.dart';

class LoginViewWithNumber extends StatefulWidget {
  const LoginViewWithNumber({super.key});

  @override
  State<LoginViewWithNumber> createState() => _LoginViewWithNumberState();
}

class _LoginViewWithNumberState extends State<LoginViewWithNumber> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnBoardingAppBar(
        firstText: 'Sign in ',
        secondText: 'to Continue',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Safely Connect with Buyers & Sellers',
                  style: Themetext.headline,
                ),
                SizedBox(height: context.mediaQueryHeight / 80),
                Text(
                  'You can connect with thousands of buyers & Sellers and quick search',
                  // style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(height: context.mediaQueryHeight / 20),
            CountryPickerTextFormField(
              hintText: 'Phone Number',
              controller: controller,
            ),
            SizedBox(height: context.mediaQueryHeight / 30),
            RoundButton(
              title: 'Continue with Mobile Number',
              textStyle:
                  Themetext.subheadline.copyWith(fontWeight: FontWeight.w600),
              onPress: () {},
              color: AppColors.greyColor,
            ),
            SizedBox(height: context.mediaQueryHeight / 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Or',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 23),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.mediaQueryHeight / 20),
            RoundButton(
              icon: Image.asset('assets/images/google.png'),
              title: 'Continue with Google',
              textStyle:
                  Themetext.subheadline.copyWith(fontWeight: FontWeight.w600),
              onPress: () {},
              color: AppColors.whiteColor,
              borderColor: Colors.grey.shade300,
            ),
            SizedBox(height: context.mediaQueryHeight / 40),
            RoundButton(
              icon: Image.asset('assets/images/sms.png'),
              title: 'Continue with Email',
              textStyle:
                  Themetext.subheadline.copyWith(fontWeight: FontWeight.w600),
              onPress: () {},
              color: AppColors.whiteColor,
              borderColor: Colors.grey.shade300,
            ),
            SizedBox(height: context.mediaQueryHeight / 10),
            RoundButton(
              title: 'Next',
              onPress: () {},
            ),
            SizedBox(height: context.mediaQueryHeight / 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Do\'t have an account?    ',
                  style: Themetext.subheadline.copyWith(fontSize: 16),
                ),
                Text(
                  'Sign up',
                  style: Themetext.blackBoldText
                      .copyWith(color: AppColors.primaryColor, fontSize: 16),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
