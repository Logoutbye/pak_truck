import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:testt/main.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/configs/utils.dart';

import 'package:testt/src/features/auth/signup/view_model/signup_viewmodel.dart';
import 'package:testt/src/features/auth/widgets/country_picker_textfiled.dart';
import 'package:testt/src/configs/components/custom_appbar.dart';
import '../../../../configs/extensions.dart';
import '../../../../configs/theme/theme_text.dart';
import 'login_view_with_email.dart';

class LoginViewWithNumber extends StatefulWidget {
  const LoginViewWithNumber({super.key});

  @override
  State<LoginViewWithNumber> createState() => _LoginViewWithNumberState();
}

class _LoginViewWithNumberState extends State<LoginViewWithNumber> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(authRepository: getIt()),
      child: Consumer<AuthViewModel>(builder: (context, loginViewModel, _) {
        return Scaffold(
          appBar: CustomAppBar(
            leading: SizedBox.shrink(),
            firstText: localization.signin_second,
            secondText: localization.signin_first,
            isSecondTextBeforeFirst: true,
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
                    loginViewModel.setSelectedCountry(country!);
                  },
                  onPhoneNumberChanged: (phone) {
                    loginViewModel.setPhonenuber(phone);
                  },
                ),
                SizedBox(height: context.mediaQueryHeight / 30),
                RoundButton(
                  loading: loginViewModel.loading,
                  title: localization.continue_mobile,
                  textStyle: Themetext.subheadline.copyWith(
                      fontWeight: FontWeight.w600,
                      color: loginViewModel.phoneNumber.isEmpty
                          ? Colors.black
                          : Colors.white),
                  onPress: () async {
                    if (loginViewModel.selectedCountry == null) {
                      Utils.flushBarErrorMessage(
                          'Please select your country', context);
                    } else if (loginViewModel.phoneNumber.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Please enter your phone number', context);
                    } else {
                      await loginViewModel.sendPhoneOtp(context);
                    }
                  },
                  color: loginViewModel.phoneNumber.isEmpty
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
                  textStyle: Themetext.subheadline
                      .copyWith(fontWeight: FontWeight.w600),
                  onPress: () {},
                  color: AppColors.white,
                  borderColor: Colors.grey.shade300,
                ),
                SizedBox(height: context.mediaQueryHeight / 40),
                RoundButton(
                  icon: Image.asset('assets/images/sms.png'),
                  title: localization.continue_email,
                  textStyle: Themetext.subheadline
                      .copyWith(fontWeight: FontWeight.w600),
                  onPress: () {
                    Navigator.push(context,
                        SlideTransitionPage(page: LoginViewWithEmail()));
                  },
                  color: AppColors.white,
                  borderColor: Colors.grey.shade300,
                ),
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
                  localization.dont_have_account,
                  style: Themetext.subheadline.copyWith(fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, RoutesName.signupViewWithNumber);
                  },
                  child: Text(
                    ' ${localization.signup_text}',
                    style: Themetext.blackBoldText
                        .copyWith(color: AppColors.primary, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
