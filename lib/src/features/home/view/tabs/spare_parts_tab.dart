import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/features/home/widget/auto_shop_widget.dart';
import 'package:testt/src/features/home/widget/build_secton_header.dart';

import 'package:testt/src/features/home/widget/vechile_card.dart';
import 'package:testt/src/features/home/widget/vechile_card_2.dart';

class SparePartsTab extends StatelessWidget {
  const SparePartsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 5;
    var width = MediaQuery.of(context).size.width / 3;
    final categories = [
      {
        'image': 'assets/images/Automatic Truck.png',
        'text': 'Automatic',
        'color': '0xFFe4e5ed', // Light Pink
      },
      {
        'image': 'assets/images/Dumper Truck.png',
        'text': 'Dumper Truck',
        'color': '0xFFf8f0e0', // Light Cyan
      },
      {
        'image': 'assets/images/Flatted.png',
        'text': 'Flatbed Truck',
        'color': '0xFFf2f1f3', // Light Orange
      },
      {
        'image': 'assets/images/Tailer Truck.png',
        'text': 'Tailer Truck',
        'color': '0xFFe7e8ee', // Light Green
      },
      {
        'image': 'assets/images/Container.png',
        'text': 'Container Carrier',
        'color': '0xFFfaf5e6', // Light Pink
      },
      {
        'image': 'assets/images/Cargo Landing.png',
        'text': 'Cargo Landing...',
        'color': '0xFFeeeef0', // Light Cyan
      },
      {
        'image': 'assets/images/Box Truck.png',
        'text': 'Box Truck',
        'color': '0xFFe7e8ee', // Light Orange
      },
      {
        'image': 'assets/images/Freezer Truck.png',
        'text': 'Freezer Truck',
        'color': '0xFFe8e8e8', // Light Green
      },
      {
        'image': 'assets/images/Tanker Truck.png',
        'text': 'Tanker Truck',
        'color': '0xFFfaf5e6', // Light Pink
      },
      {
        'image': 'assets/images/Dump truck.png',
        'text': 'Dump truck',
        'color': '0xFFf2f1f3', // Light Cyan
      },
    ];

    final pageController = PageController(); // Controller for PageView

    // Split categories into pages of 8 items each
    final pages = List.generate(
      (categories.length / 8).ceil(),
      (index) => categories.sublist(
        index * 8,
        (index + 1) * 8 > categories.length
            ? categories.length
            : (index + 1) * 8,
      ),
    );

    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: height * 1.2,
            child: PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              itemBuilder: (context, pageIndex) {
                final pageCategories = pages[pageIndex];
                return Center(
                  child: Wrap(
                    spacing: width * 0.04,
                    children: pageCategories.map((category) {
                      return Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: (context.mediaQueryWidth - 29) / 4,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border:
                              Border.all(color: Colors.grey.shade300, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Color(int.parse(category['color']!)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        category['image']!,
                                        height: height * 0.32,
                                        width: width * 0.63,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: context.mediaQueryHeight / 150),
                              Text(
                                category['text']!,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: height * 0.06,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: context.mediaQueryHeight / 150),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: context.mediaQueryHeight / 75),
          SmoothPageIndicator(
            controller: pageController,
            count: pages.length,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColors.primary,
              dotColor: Colors.grey.shade300,
              dotHeight: height * 0.04,
              dotWidth: height * 0.04,
            ),
          ),
          SizedBox(height: 12.h),
          buildSectionHeader(context,
              title: 'Agriculture Machine for Sale ', onViewAllPressed: () {}),
          VechileCard(
            cardWidthRatio: 0.6,
            items: [
              {
                'image': 'assets/remove/truck.png',
                'title': 'Dumper Truck',
                'price': 'PKR. 3,800,000',
                'location': 'Islamabad'
              },
              {
                'image': 'assets/remove/truck_1.png',
                'title': 'Automatic Truck',
                'price': 'PKR. 3,800,000',
                'location': 'Lahore'
              },
              {
                'image': 'assets/images/remove_me2.png',
                'title': 'Box Truck',
                'price': 'PKR. 3,800,000',
                'location': 'Karachi'
              },
            ],
          ),
          SizedBox(height: 12.h),
          vechileCard2(context, newsItems, ),
        ],
      ),
    );
  }
}
