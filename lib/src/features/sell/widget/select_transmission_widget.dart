import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../view_model/sell_truck_view_model.dart';

class SelectTransmissionWidget extends StatelessWidget {
  const SelectTransmissionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Manual and Automatic Transmission in a Row
        Consumer<SellTuckViewModel>(
          builder: (context, provider, _) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    provider.selectTransmission('Imported');
                  },
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          value: provider.selectedTransmission == 'Imported',
                          onChanged: (value) {
                            provider.selectTransmission('Imported');
                          },
                        ),
                      ),
                      Text(
                        'Imported',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(width: 12.w),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    provider.selectTransmission('Local');
                  },
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          value: provider.selectedTransmission == 'Local',
                          onChanged: (value) {
                            provider.selectTransmission('Local');
                          },
                        ),
                      ),
                      Text(
                        'Local',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(width: 12.w),
                    ],
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
