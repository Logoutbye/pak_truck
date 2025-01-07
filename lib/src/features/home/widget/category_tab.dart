import 'package:flutter/material.dart';
import 'package:testt/src/configs/color/color.dart';

Widget buildCategoryTab({
  required BuildContext context,
  required double height,
  required double width,
}) {
  final categories = [
    {
      'image': 'assets/images/mini_truck.png',
      'text': 'Mini Truck',
      'color': '0xFFE0F7FA', // Light Cyan
    },
    {
      'image': 'assets/images/used_truck.png',
      'text': 'Used Truck',
      'color': '0xFFFCE4EC', // Light Pink
    },
    {
      'image': 'assets/images/earth_movable.png',
      'text': 'Earth moving...',
      'color': '0xFFFFF3E0', // Light Orange
    },
    {
      'image': 'assets/images/agricultural.png',
      'text': 'Agriculture Truck',
      'color': '0xFFE8F5E9', // Light Green
    },
  ];

  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: categories.length,
    itemBuilder: (context, index) {
      final category = categories[index];
      return Container(
        height: height,
        width: width,
        margin: const EdgeInsets.only(top: 8, left: 4, right: 4, bottom: 34),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: Colors.grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 4, left: 4, right: 4),
                decoration: BoxDecoration(
                  color:
                      Color(int.parse(category['color']!)), // Background color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      category['image']!,
                      height: height * 0.4, // Dynamic image height
                      width: width * 0.6, // Dynamic image width
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                category['text']!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: height * 0.06,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
