import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/configs/components/custom_appbar.dart';
import 'package:testt/src/features/account_verification/view_model/verify_individual_view_model.dart';
import '../../../../configs/extensions.dart';
import '../../../../configs/theme/theme_text.dart';
import '../../../../configs/components/custom_text_filed.dart';
import '../view_model/signup_viewmodel.dart';

class SignUpViewWithEmail extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  SignUpViewWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Consumer<SignUpViewModel>(builder: (context, signUpViewModel, _) {
      return Scaffold(
        appBar: CustomAppBar(
          firstText: '',
          secondText: localization.skinadar,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localization.sign_up,
                        style: Themetext.headline.copyWith(
                            color: AppColors.primary, fontSize: 21),
                      ),
                      SizedBox(height: context.mediaQueryHeight / 80),
                      Text(
                        'Don’t have an account? Create your account',
                      ),
                    ],
                  ),
                  SizedBox(height: context.mediaQueryHeight / 20),
                  Text('Email',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  SizedBox(height: context.mediaQueryHeight / 75),
                  CustomTextFormField(
                    maxLines: 1,
                    minLines: 1,
                    hintText: 'Enter your email',
                    controller: _emailController,
                  ),
                  if (signUpViewModel.showOtpField) ...[
                    SizedBox(height: context.mediaQueryHeight / 30),
                    Text('OTP',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700)),
                    SizedBox(height: context.mediaQueryHeight / 75),
                    CustomTextFormField(
                      hintText: 'Enter OTP',
                      controller: _otpController,
                      // keyboardType: TextInputType.number,
                    ),
                  ],
                  SizedBox(height: context.mediaQueryHeight / 30),
                ],
              ),
              Spacer(),
              RoundButton(
                loading: signUpViewModel.loading,
                title: signUpViewModel.showOtpField
                    ? 'Verfiy Otp'
                    : localization.sign_up,
                onPress: () {
                  if (signUpViewModel.showOtpField) {
                    // Verify OTP
                    if (_otpController.text.isEmpty) {
                      Utils.flushBarErrorMessage('Please enter OTP', context);
                    } else {
                      context
                          .read<VerifyIndividualViewModel>()
                          .setEmail(_emailController.text);
                      context
                          .read<VerifyIndividualViewModel>()
                          .setOtp(_otpController.text);
                      Navigator.pushNamed(
                          context, RoutesName.chooseAccountScreen);
                    }
                  } else {
                    // Send OTP
                    if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Please enter your email', context);
                    } else {
                      final emailData = {'email': _emailController.text};
                      signUpViewModel.sendEmailOtp(context, emailData);
                    }
                  }
                },
              ),
              SizedBox(height: context.mediaQueryHeight / 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localization.already_have_account,
                    style: Themetext.subheadline.copyWith(fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RoutesName.loginViewWithNumber);
                    },
                    child: Text(
                      ' ${localization.signin}',
                      style: Themetext.blackBoldText.copyWith(
                          color: AppColors.primary, fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.mediaQueryHeight / 30),
            ],
          ),
        ),
      );
    });
  }
}
