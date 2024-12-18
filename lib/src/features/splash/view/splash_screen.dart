import 'package:flutter/material.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import '../services/splash/splash_services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: context.mediaQueryHeight / 4),
            Image.asset('assets/images/splash.png'),
            SizedBox(height: context.mediaQueryHeight / 35),
            Text(
              localization.welcome_title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: context.mediaQueryHeight / 75),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                localization.welcome_message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Spacer(),
            RoundButton(
              title: localization.next_button,
              onPress: () {
                splashServices.checkAuthentication(context);
              },
            ),
            SizedBox(height: context.mediaQueryHeight / 15),
          ],
        ),
      ),
    );
  }
}
