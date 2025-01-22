// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/auth/login/view_model/login_view_model.dart';
import 'package:testt/src/configs/components/custom_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginVerifyOtpScreen extends StatefulWidget {
  final String phoneNumber;
  const LoginVerifyOtpScreen({super.key, required this.phoneNumber});

  @override
  State<LoginVerifyOtpScreen> createState() => _LoginVerifyOtpScreenState();
}

class _LoginVerifyOtpScreenState extends State<LoginVerifyOtpScreen> {
  final TextEditingController _controller = TextEditingController();

  int _start = 30; // Initial timer in seconds
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _start = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();

    _controller.dispose();

    super.dispose();
  }

  Widget _buildOTPField() {
    return Pinput(
      controller: _controller,
      length: 6, // Number of OTP digits
      focusNode: FocusNode(),
      closeKeyboardWhenCompleted:
          true, // Close the keyboard when OTP is complete
      onCompleted: (pin) async {
        await context.read<LoginViewModel>().verifyOtp(context, pin).then((_) {
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.chooseAccountScreen, (route) => false);
        }).onError((e, s) {
          Utils.flushBarErrorMessage(e.toString(), context);
        });
      },
      onChanged: (pin) {
        // Handle OTP change here if needed
      },
      defaultPinTheme: PinTheme(
        width: 45,
        height: 55,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.grey, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        firstText: 'Verify your number',
        secondText: '',
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 18),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.mediaQueryHeight / 16),
              Text(
                localization.enterOtp,
                style: Themetext.headline,
              ),
              SizedBox(height: context.mediaQueryHeight / 80),
              Text.rich(
                TextSpan(
                  text: localization.otpIntro,
                  children: [
                    TextSpan(
                      text: widget.phoneNumber,
                      style: Themetext.blackBoldText.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: localization.otpOutro,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Wrong number?',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
          const SizedBox(height: 30),
          if (_start > 0)
            Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  _buildSplitTimerBox(),
                ],
              ),
            ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildOTPField(),
            ],
          ),
          const SizedBox(height: 30),
          if (_start > 0)
            Text(
              'You can Request a new OTP after $_start seconds',
              style: Themetext.textTheme.bodyMedium?.copyWith(fontSize: 15),
            )
          else
            TextButton(
              onPressed: () async {
                _startTimer();
                await context.read<LoginViewModel>().reSendPhoneOtp(context);
                setState(() {});
              },
              child: const Text(
                'Resend Code',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
        ],
      ),
    );
  }
Widget _buildSplitTimerBox() {
  // Extract minutes and seconds
  final minutes = (_start ~/ 60).toString().padLeft(2, '0');
  final seconds = (_start % 60).toString().padLeft(2, '0');

  // Box builder
  Widget _buildBox(String value) {
    return Container(
      alignment: Alignment.center,
      width: context.mediaQueryWidth/12, // Fixed width for uniformity
      height: context.mediaQueryHeight/30, // Fixed height for a square box
      decoration: BoxDecoration(
        color: Colors.white, // White background
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grey),
      ),
      child: Text(
        value,
        style: Themetext.headline.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildBox(minutes), // Minutes box
      const SizedBox(width: 5), // Space between boxes
      Text(
        ":",
        style: Themetext.headline.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(width: 5), // Space between colon and seconds
      _buildBox(seconds), // Seconds box
    ],
  );
}

}
