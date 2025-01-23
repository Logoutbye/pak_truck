import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import '../view_model/sell_truck_view_model.dart';

class SelectEngineTypeWidget extends StatelessWidget {
  const SelectEngineTypeWidget({
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
            'Engine Type',
            style: Themetext.superHeadline,
          ),
          const SizedBox(height: 12), // Add spacing below the title

          // Manual and Automatic Transmission in a Row
          Consumer<SellTuckViewModel>(
            builder: (context, provider, _) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.selectEngineType('4c');
                    },
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            value: provider.selectedEngineType == '4c',
                            onChanged: (value) {
                              provider.selectEngineType('4c');
                            },
                          ),
                        ),
                        Text(
                          '4c',
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
                      provider.selectEngineType('6c');
                    },
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            value: provider.selectedEngineType == '6c',
                            onChanged: (value) {
                              provider.selectEngineType('6c');
                            },
                          ),
                        ),
                        Text(
                          '6c',
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
                      provider.selectEngineType('8c');
                    },
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            value: provider.selectedEngineType == '8c',
                            onChanged: (value) {
                              provider.selectEngineType('8c');
                            },
                          ),
                        ),
                        Text(
                          '8c',
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
      ),
    );
  }
}
