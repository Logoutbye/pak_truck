// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:testt/main.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/auth/view_model/auth_view_model.dart';
import 'package:testt/src/configs/components/custom_appbar.dart';
import '../../../../configs/extensions.dart';
import '../../../../configs/theme/theme_text.dart';
import '../../../../configs/components/custom_text_filed.dart';

class LoginViewWithEmail extends StatefulWidget {
  const LoginViewWithEmail({super.key});

  @override
  State<LoginViewWithEmail> createState() => _LoginViewWithEmailState();
}

class _LoginViewWithEmailState extends State<LoginViewWithEmail> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(authRepository: getIt()),
      child: Consumer<LoginViewModel>(builder: (context, loginViewModel, _) {
        return Scaffold(
          appBar: CustomAppBar(
            firstText: '',
            secondText: 'Already have an account',
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
                          localization.signin,
                          style: Themetext.headline.copyWith(
                              color: AppColors.primaryColor, fontSize: 21),
                        ),
                        SizedBox(height: context.mediaQueryHeight / 80),
                        Text(
                          'Don’t have an account Create You\'re Account',
                        ),
                      ],
                    ),
                    SizedBox(height: context.mediaQueryHeight / 20),
                    // AuthTextFormField(
                    //   hintText: 'Enter your name',
                    //   controller: _nameController,
                    // ),
                    // SizedBox(height: context.mediaQueryHeight / 30),
                    CustomTextFormField(
                      hintText: 'Enter your email',
                      controller: _emailController,
                    ),
                    SizedBox(height: context.mediaQueryHeight / 30),
                    CustomTextFormField(
                      hintText: 'Enter your password',
                      controller: _passwordController,
                    ),
                    SizedBox(height: context.mediaQueryHeight / 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        RoundButton(
                            width: context.mediaQueryWidth / 2.5,
                            textStyle: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            color: AppColors.primaryLight,
                            title: 'Forgot password?',
                            onPress: () {
                              Navigator.pushNamed(
                                  context, RoutesName.forgotPassword);
                            })
                      ],
                    )
                  ],
                ),
                Spacer(),
                // need gap here that
                Consumer<LoginViewModel>(
                  builder: (BuildContext context, LoginViewModel provider,
                      Widget? child) {
                    return RoundButton(
                      loading: provider.loading ? true : false,
                      title: 'Login',
                      onPress: () {
                        // if (_nameController.text.isEmpty) {
                        //   Utils.flushBarErrorMessage(
                        //       'Please enter your name', context);
                        // } else
                        if (_emailController.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              'Please enter your email', context);
                        } else if (_passwordController.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              'Please enter your password', context);
                        } else {
                          Map data = {
                            // 'name': _nameController.text.trim(),
                            'email': _emailController.text.trim(),
                            'password': _passwordController.text.trim(),
                          };
                          provider.signinWithEmail(context, data).then((value) {
                            Navigator.pushNamed(context, RoutesName.chooseAccountScreen);
                          }).onError((error, stackTrace) {
                            Utils.flushBarErrorMessage(
                                error.toString(), context);
                          });
                        }
                      },
                    );
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
                            color: AppColors.primaryColor, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.mediaQueryHeight / 30),
              ],
            ),
          ),
        );
      }),
    );
  }
}
