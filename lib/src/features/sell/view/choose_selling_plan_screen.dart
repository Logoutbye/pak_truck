import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/sell/view_model/sell_truck_view_model.dart';

class ChooseSellingPlanScreen extends StatelessWidget {
  const ChooseSellingPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
       foregroundColor: AppColors.white,
        title: const Text(
          'Choose a plan',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How do you want to Sell your Truck?',
              style: Themetext.headline.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: 24),
            // First Card: Sell it myself
            _buildOptionCard(
              title: 'Sell it myself!',
              description:
                  'Post your Ad to find the best offer from our verified buyers',
              actionText: 'I can find the best offer',
              imagePath: 'assets/images/splash.png',
              onTap: () {
                context.read<SellTuckViewModel>().setPlan('Sell it myself');
                Navigator.pushNamed(context, RoutesName.sellTruckScreen);
              },
            ),
            const SizedBox(height: 20),
            // Second Card: Sell it for me
            _buildOptionCard(
              title: 'Sell it for me!',
              description:
                  'Have a Truck to sell, but no time to bargain best offers ?',
              actionText: 'I want experts to sell my Truck',
              imagePath: 'assets/images/splash.png',
              onTap: () {
                context.read<SellTuckViewModel>().setPlan('Sell it for me');
                Navigator.pushNamed(context, RoutesName.sellTruckScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Reusable method to build cards
  Widget _buildOptionCard({
    required String title,
    required String description,
    required String actionText,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: AppColors.divider)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      actionText,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                imagePath,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
