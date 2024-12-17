import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/app_constants.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/sell/view_model/sell_truck_view_model.dart';

class SelectTruckFeaturesWidget extends StatelessWidget {
  const SelectTruckFeaturesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SellTuckViewModel>(
      builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Truck Feature', style: Themetext.superHeadline),
              const SizedBox(height: 16),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 8, // Adjust for checkbox alignment
                ),
                itemCount: truckFeatures.length,
                itemBuilder: (context, index) {
                  final feature = truckFeatures[index];
                  return Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                         
                          value: provider.isSelected(feature),
                          onChanged: (value) {
                            provider.toggleFeature(feature);
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          feature,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
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
      },
    );
  }
}
