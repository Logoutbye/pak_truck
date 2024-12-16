import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/theme/theme_text.dart';

import '../view_model/sell_view_model.dart';

class SelectTransmissionTypeWidget extends StatelessWidget {
  const SelectTransmissionTypeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Transmission Type',
        ),
        const SizedBox(height: 12), // Add spacing below the title

        // Manual and Automatic Transmission in a Row
        Consumer<SellViewModel>(
          builder: (context, provider, _) {
            return Row(
              children: [
                // Manual Checkbox
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      provider.selectTransmission('Manual');
                    },
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 1.3, // Increase checkbox size
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            value: provider.selectedTransmission == 'Manual',
                            onChanged: (value) {
                              provider.selectTransmission('Manual');
                            },
                            activeColor: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 12), // Adjust spacing
                        Text('Manual',
                            style: Themetext.headline.copyWith(fontSize: 16)),
                      ],
                    ),
                  ),
                ),

                // Automatic Checkbox
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      provider.selectTransmission('Automatic');
                    },
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 1.3, // Increase checkbox size
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            value: provider.selectedTransmission == 'Automatic',
                            onChanged: (value) {
                              provider.selectTransmission('Automatic');
                            },
                            activeColor: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 12), // Adjust spacing
                        Text('Automatic',
                            style: Themetext.headline.copyWith(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
