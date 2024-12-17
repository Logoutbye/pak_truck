import 'package:flutter/material.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/theme/theme_text.dart';

class MyAdDetailScreen extends StatelessWidget {
  const MyAdDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        title: const Text(
          'My Ads',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Manage Ads Section
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Manage this Ads', style: Themetext.headline),
                      Icon(Icons.more_horiz, color: AppColors.blackColor),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/truck.png', // Replace with your image path
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Title & Price
                  Text(
                    'Truck Swift DLX Automatic\n1.3 2024',
                    style: Themetext.headline.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text('PKR, 22 Lack',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                  const SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur. Sagittis facilisis augue posuere eu iaculis est.',
                    style: Themetext.subheadline,
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey[300]),

            // Truck Detail Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Truck Detail',
                      style: Themetext.headline.copyWith(fontSize: 18)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _iconWithText(Icons.calendar_today, '2024'),
                      _iconWithText(Icons.speed, '103,950 km'),
                      _iconWithText(Icons.local_gas_station, 'Petrol'),
                      _iconWithText(Icons.settings, 'Automatic'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _truckDetailItem('Registered in', 'Sindh'),
                  _truckDetailItem('Brand', 'Hino Pakistan'),
                  _truckDetailItem('Model', 'Hino Pakistan'),
                  _truckDetailItem('Color Pilers', 'Green Orange'),
                  _truckDetailItem('Body Type', 'N/A'),
                  _truckDetailItem('Engine Capacity', '1000 (cc)'),
                  _truckDetailItem('Last update', '11 Nov, 2024'),
                  _truckDetailItem('Ad Ref', '9236459'),
                  _truckDetailItem('Assembly', 'Imported'),
                ],
              ),
            ),
            Divider(color: Colors.grey[300]),

            // Truck Features Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Truck Feature',
                      style: Themetext.headline.copyWith(fontSize: 18)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _featureItem('ABS'),
                      _featureItem('AM/FM Radio'),
                      _featureItem('Air Bags'),
                      _featureItem('Air Conditioning'),
                      _featureItem('Alloy Rims'),
                      _featureItem('CD Player'),
                      _featureItem('Immobilizer Key'),
                      _featureItem('Keyless Entry'),
                      _featureItem('Power Locks'),
                      _featureItem('Power Mirrors'),
                      _featureItem('Power Steering'),
                      _featureItem('Power Windows'),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Bottom Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _actionButton(Icons.edit, 'Edit'),
                  _actionButton(Icons.check_circle_outline, 'Mark as Sold'),
                  _actionButton(Icons.delete, 'Remove your ad'),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _iconWithText(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primaryColor, size: 30),
        const SizedBox(height: 4),
        Text(text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }

  Widget _truckDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.black54)),
          Text(value,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black)),
        ],
      ),
    );
  }

  Widget _featureItem(String feature) {
    return Chip(
      avatar: Icon(Icons.check_circle, color: AppColors.primaryColor, size: 20),
      label: Text(feature,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      backgroundColor: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primaryColor, size: 28),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: AppColors.primaryColor)),
      ],
    );
  }
}
