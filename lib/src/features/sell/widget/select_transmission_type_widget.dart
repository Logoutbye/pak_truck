import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import '../view_model/sell_truck_view_model.dart';

class SelectTransmissionTypeWidget extends StatelessWidget {
  const SelectTransmissionTypeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transmission Type',
            style: Themetext.superHeadline,
          ),
          const SizedBox(height: 12), // Add spacing below the title

          // Manual and Automatic Transmission in a Row
          Consumer<SellTuckViewModel>(
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
                            scale: 1.2, 
                            child: Checkbox(
                              value: provider.selectedTransmission == 'Manual',
                              onChanged: (value) {
                                provider.selectTransmission('Manual');
                              },
                            ),
                          ),

                          const SizedBox(width: 12), // Adjust spacing
                          Text(
                            'Manual',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                          ),
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
                            scale: 1.2,
                            child: Checkbox(
                            
                              value: provider.selectedTransmission == 'Automatic',
                              onChanged: (value) {
                                provider.selectTransmission('Automatic');
                              },
                            ),
                          ),
                          const SizedBox(width: 12), // Adjust spacing
                          Text(
                            'Automatic',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
