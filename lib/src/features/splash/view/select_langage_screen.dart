import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/splash/services/session_manager/session_controller.dart';
import 'package:testt/src/features/splash/view_model/local_provider.dart';
import '../../../configs/components/inline_drop_down_widget.dart';
import '../services/splash/splash_services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectLanguageScreen extends StatefulWidget {
  final bool fromProfileScreen;
  const SelectLanguageScreen({super.key, this.fromProfileScreen = false});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  SplashServices splashServices = SplashServices();
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              children: [
                Image.asset('assets/images/welcome.png'),

                Text(
                  'Chose Language',
                  // localization.welcome_title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: context.mediaQueryHeight / 80),

                Text(
                  'We will show the content in your preferred language.',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                SizedBox(height: context.mediaQueryHeight / 30),
                // Language Dropdown
                InlineDropdown<String>(
                  expandedHeight: context.mediaQueryHeight / 9,
                  hintText: localization.select_language,
                  leadingSVG: 'assets/svg/language.svg',
                  items: [
                    'English',
                    'Urdu',
                  ],
                  selectedItem: selectedLanguage,
                  onChanged: (value) async {
                    setState(() {
                      selectedLanguage = value;
                    });
                    await SessionController().saveLanguageInPreference();
                  },
                  itemLabelBuilder: (item) => item,
                ),
              ],
            ),
            Column(
              children: [
                RoundButton(
                  title: 'Next',
                  onPress: () {
                    if (selectedLanguage == null) {
                      Utils.snackBar('Please select a language', context);
                    } else {
                      Locale locale = selectedLanguage == 'Urdu'
                          ? const Locale('ur')
                          : const Locale('en');
                      // Update LocaleProvider
                      Provider.of<LocaleProvider>(context, listen: false)
                          .setLocale(locale);
                      if (widget.fromProfileScreen) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushNamed(
                            context, RoutesName.loginViewWithNumber);
                      }
                    }
                  },
                  color: selectedLanguage != null
                      ? AppColors.primary
                      : Colors.grey,
                ),
                SizedBox(
                  height: context.mediaQueryHeight / 21,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
