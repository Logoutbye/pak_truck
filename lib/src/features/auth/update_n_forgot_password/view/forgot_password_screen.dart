// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:testt/main.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/auth/signup/view_model/signup_viewmodel.dart';
import 'package:testt/src/configs/components/custom_appbar.dart';
import '../../../../configs/extensions.dart';
import '../../../../configs/theme/theme_text.dart';
import '../../../../configs/components/custom_text_filed.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
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
                      hintText: 'Enter your email',
                      controller: _emailController,
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
                        if (_emailController.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              'Please enter your email', context);
                        } else {
                          provider.forgotPassword(
                              context, _emailController.text.trim());
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
