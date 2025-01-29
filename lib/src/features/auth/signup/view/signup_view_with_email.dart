import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/routes/routes_name.dart';

import 'package:testt/src/configs/components/custom_appbar.dart';
import 'package:testt/src/configs/utils.dart';
import '../../../../configs/extensions.dart';
import '../../../../configs/theme/theme_text.dart';
import '../../../../configs/components/custom_text_filed.dart';
import '../view_model/signup_viewmodel.dart';

class SignUpViewWithEmail extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  SignUpViewWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Consumer<AuthViewModel>(builder: (context, signUpViewModel, _) {
      return Scaffold(
        appBar: CustomAppBar(
          firstText: '',
          secondText: localization.create_an_account,
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
                        style: Themetext.headline
                            .copyWith(color: AppColors.primary, fontSize: 21),
                      ),
                      SizedBox(height: context.mediaQueryHeight / 80),
                      Text(
                        'Don’t have an account? Create your account',
                      ),
                    ],
                  ),
                  SizedBox(height: context.mediaQueryHeight / 20),
                  Text('Name',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  SizedBox(height: context.mediaQueryHeight / 75),
                  CustomTextFormField(
                    maxLines: 1,
                    minLines: 1,
                    hintText: 'Enter your name',
                    controller: _nameController,
                  ),
                  SizedBox(height: context.mediaQueryHeight / 40),
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
                  SizedBox(height: context.mediaQueryHeight / 40),
                  Text('Password',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  SizedBox(height: context.mediaQueryHeight / 75),
                  CustomTextFormField(
                    isPassword: true,
                    maxLines: 1,
                    minLines: 1,
                    hintText: 'Enter your password',
                    controller: _passwordController,
                  ),
                  SizedBox(height: context.mediaQueryHeight / 40),
                  Text('Confirm Password',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  SizedBox(height: context.mediaQueryHeight / 75),
                  CustomTextFormField(
                    isPassword: true,
                    maxLines: 1,
                    minLines: 1,
                    hintText: 'Enter your password again',
                    controller: _confirmPasswordController,
                  ),
                  SizedBox(height: context.mediaQueryHeight / 30),
                ],
              ),
              Spacer(),
              RoundButton(
                loading: signUpViewModel.loading,
                title: localization.sign_up,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Email cannot be empty', context);
                  } else if (_nameController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Name cannot be empty', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Password cannot be empty', context);
                  } else if (_confirmPasswordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Please enter correct password again', context);
                  } else if (_confirmPasswordController.text !=
                      _passwordController.text) {
                    Utils.flushBarErrorMessage('Please donot match', context);
                  } else {
                    var data = {
                      "fullname": _nameController.text,
                      "email": _emailController.text,
                      "password": _passwordController.text,
                    };
                    signUpViewModel.signUpWithEmail(context, data);
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
                      style: Themetext.blackBoldText
                          .copyWith(color: AppColors.primary, fontSize: 16),
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
