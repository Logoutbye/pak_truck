// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:testt/main.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/auth/signup/view/signup_view_with_number.dart';
import 'package:testt/src/configs/components/custom_appbar.dart';
import 'package:testt/src/features/auth/signup/view_model/signup_viewmodel.dart';
import '../../../../configs/extensions.dart';
import '../../../../configs/theme/theme_text.dart';
import '../../../../configs/components/custom_text_filed.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController _cnfirmPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _cnfirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(authRepository: getIt()),
      child: Consumer<AuthViewModel>(builder: (context, loginViewModel, _) {
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
                          'Reset You\'re Password',
                          style: Themetext.headline.copyWith(fontSize: 21),
                        ),
                        SizedBox(height: context.mediaQueryHeight / 80),
                        Text(
                          'Please conform your email address and we will send a verification code.',
                        ),
                      ],
                    ),
                    SizedBox(height: context.mediaQueryHeight / 20),
                    CustomTextFormField(
                      hintText: 'Enter your password',
                      controller: _newPasswordController,
                    ),
                    SizedBox(height: context.mediaQueryHeight / 20),
                    CustomTextFormField(
                      hintText: 'Confrim your password',
                      controller: _cnfirmPasswordController,
                    ),
                  ],
                ),
                Spacer(),
                // need gap here that
                Consumer<AuthViewModel>(
                  builder: (BuildContext context, AuthViewModel provider,
                      Widget? child) {
                    return RoundButton(
                      loading: provider.loading ? true : false,
                      title: 'Send Code',
                      onPress: () {
                        if (_newPasswordController.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              'Please enter new password', context);
                        } else if (_cnfirmPasswordController.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              'Please enter password again', context);
                        } else if (_cnfirmPasswordController.text !=
                            _newPasswordController.text) {
                          Utils.flushBarErrorMessage(
                              'Password do not match', context);
                        } else {
                          Map data = {
                            'email': _cnfirmPasswordController.text.trim(),
                            'password': _cnfirmPasswordController.text.trim(),
                          };
                          provider.resetPassword(context, data).then((value) {
                            Navigator.push(
                                context,
                                SlideTransitionPage(
                                    page: SignUpViewWithNumber()));
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
              ],
            ),
          ),
        );
      }),
    );
  }
}
