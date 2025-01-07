import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';

Widget buildTwoRowHorizontalList(BuildContext context) {
  final row1Items = [
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Dumper Truck',
      'price': 'PKR. 3,800,000',
      'location': 'Islamabad'
    },
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Automatic Truck',
      'price': 'PKR. 3,800,000',
      'location': 'Lahore'
    },
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Box Truck',
      'price': 'PKR. 3,800,000',
      'location': 'Karachi'
    },
  ];

  final row2Items = [
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Flatbed Truck',
      'price': 'PKR. 3,800,000',
      'location': 'Quetta'
    },
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Tailer Truck',
      'price': 'PKR. 3,800,000',
      'location': 'Peshawar'
    },
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Container Truck',
      'price': 'PKR. 3,800,000',
      'location': 'Faisalabad'
    },
  ];

  return Column(
    children: [
      SizedBox(height: context.mediaQueryHeight / 75),
      SizedBox(
        height: context.mediaQueryHeight / 4.2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: row1Items.length,
          itemBuilder: (context, index) {
            final item = row1Items[index];
            return _buildItem(context, item);
          },
        ),
      ),
      SizedBox(height: context.mediaQueryHeight / 50),
      SizedBox(
        height: context.mediaQueryHeight / 4.2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: row2Items.length,
          itemBuilder: (context, index) {
            final item = row2Items[index];
            return _buildItem(context, item);
          },
        ),
      ),
    ],
  );
}

Widget _buildItem(BuildContext context, Map<String, String> item) {
  return Container(
    height: context.mediaQueryHeight / 2,
    width: context.mediaQueryWidth / 2.4, // Adjust width for horizontal scroll
    margin: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            item['image']!,
            height: context.mediaQueryHeight / 6,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: context.mediaQueryHeight / 100),
              Row(
                children: [
                  SvgPicture.asset('assets/svg/location.svg'),
                  SizedBox(width: 8),
                  Text(
                    item['location']!,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
