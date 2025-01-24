import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/auth/signup/view_model/signup_viewmodel.dart';

class CountryPickerTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<Country?>? onCountrySelected;
  final ValueChanged<String>? onPhoneNumberChanged;
  final bool isPassword;

  const CountryPickerTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onCountrySelected,
    this.onPhoneNumberChanged,
    this.isPassword = false,
  });

  @override
  _CountryPickerTextFormFieldState createState() =>
      _CountryPickerTextFormFieldState();
}

class _CountryPickerTextFormFieldState
    extends State<CountryPickerTextFormField> {
  Country? selectedCountry;
  @override
  void initState() {
    super.initState();
    // Initialize the selectedCountry with Pakistan by default
    selectedCountry = Country(
      phoneCode: '92', // Pakistan's phone code
      countryCode: 'PK', // Pakistan's 2-letter country code
      e164Sc: 0, // e164Sc value (use 0 for default)
      geographic: true, // Pakistan is a geographic country
      level: 1, // Set level (1 is typical for countries)
      name: 'Pakistan', // Country name
      nameLocalized: 'Pakistan', // Localized name (optional)
      example: '+92 300 1234567', // Example phone number
      displayName: 'Pakistan +92', // Display name with phone code
      displayNameNoCountryCode: 'Pakistan', // Display name without phone code
      e164Key: 'PK', // e164 key (often the 2-letter country code)
      fullExampleWithPlusSign: '+923001234567', // Full example with '+' sign
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<AuthViewModel>(context, listen: false)
          .setSelectedCountry(selectedCountry!);

    });
    return Container(
      height: context.mediaQueryHeight / 17,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black38),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                onSelect: (Country country) {
                  setState(() {
                    selectedCountry = country;
                  });
                  if (widget.onCountrySelected != null) {
                    widget.onCountrySelected!(country);
                  }
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    selectedCountry != null
                        ? '${selectedCountry!.flagEmoji} +${selectedCountry!.phoneCode}'
                        : '🌍 +XX',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: context.mediaQueryHeight / 35,
                    width: 2,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              obscureText: widget.isPassword,
              style: Themetext.subheadline,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
              onChanged: (value) {
                if (widget.onPhoneNumberChanged != null) {
                  widget.onPhoneNumberChanged!(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
