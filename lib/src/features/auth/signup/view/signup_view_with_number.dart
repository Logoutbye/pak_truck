import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/auth/signup/view/signup_view_with_email.dart';
import 'package:testt/src/features/auth/signup/view_model/signup_viewmodel.dart';
import 'package:testt/src/features/auth/widgets/country_picker_textfiled.dart';
import 'package:testt/src/configs/components/custom_appbar.dart';
import '../../../../configs/extensions.dart';
import '../../../../configs/theme/theme_text.dart';

class SignUpViewWithNumber extends StatefulWidget {
  const SignUpViewWithNumber({super.key});

  @override
  State<SignUpViewWithNumber> createState() => _SignUpViewWithNumberState();
}

class _SignUpViewWithNumberState extends State<SignUpViewWithNumber> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Consumer<AuthViewModel>(builder: (context, signupViewModel, _) {
      return Scaffold(
        appBar: CustomAppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, RoutesName.loginViewWithNumber);
              },
              icon: Icon(Icons.arrow_back)),
          firstText: localization.create_an_account,
          secondText: localization.sign_up,
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
                    localization.safely_connect,
                    style: Themetext.headline,
                  ),
                  SizedBox(height: context.mediaQueryHeight / 80),
                  Text(
                    localization.connect_message,
                  ),
                ],
              ),
              SizedBox(height: context.mediaQueryHeight / 20),
              CountryPickerTextFormField(
                hintText: "Enter your phone number",
                controller: _controller,
                onCountrySelected: (country) {
                  signupViewModel.setSelectedCountry(country!);
                },
                onPhoneNumberChanged: (phone) {
                  signupViewModel.setPhonenuber(phone);
                },
              ),
              SizedBox(height: context.mediaQueryHeight / 30),
              RoundButton(
                loading: signupViewModel.loading,
                title: localization.continue_mobile,
                textStyle: Themetext.subheadline.copyWith(
                    fontWeight: FontWeight.w600,
                    color: signupViewModel.phoneNumber.isEmpty
                        ? Colors.black
                        : Colors.white),
                onPress: () async {
                  if (signupViewModel.selectedCountry == null) {
                    Utils.flushBarErrorMessage(
                        'Please select your country', context);
                  } else if (signupViewModel.phoneNumber.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Please enter your phone number', context);
                  } else {
                    signupViewModel.sendPhoneOtp(context);
                  }
                },
                color: signupViewModel.phoneNumber.isEmpty
                    ? AppColors.greyColor
                    : AppColors.primary,
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
                    Text('Or'),
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
                title: localization.continue_google,
                textStyle:
                    Themetext.subheadline.copyWith(fontWeight: FontWeight.w600),
                onPress: () {},
                color: AppColors.white,
                borderColor: Colors.grey.shade300,
              ),
              SizedBox(height: context.mediaQueryHeight / 40),
              RoundButton(
                icon: Image.asset('assets/images/sms.png'),
                title: localization.continue_email,
                textStyle:
                    Themetext.subheadline.copyWith(fontWeight: FontWeight.w600),
                onPress: () {
                  Navigator.push(context,
                      SlideTransitionPage(page: SignUpViewWithEmail()));
                },
                color: AppColors.white,
                borderColor: Colors.grey.shade300,
              ),
              SizedBox(height: context.mediaQueryHeight / 10),
            ],
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.only(bottom: 38.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                localization.already_have_account,
                style: Themetext.subheadline.copyWith(fontSize: 16),
              ),
              SizedBox(width: context.mediaQueryWidth / 75),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, RoutesName.loginViewWithNumber);
                },
                child: Text(
                  ' ${localization.signin}',
                  style: Themetext.blackBoldText
                      .copyWith(color: AppColors.primary, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
