import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/features/home/main/widget/auto_shop_widget.dart';
import 'package:testt/src/features/home/main/widget/build_secton_header.dart';

import 'package:testt/src/features/home/main/widget/vechile_horizantal_card.dart';
import 'package:testt/src/features/home/main/widget/vechile_card_2.dart';
import 'package:testt/src/features/home/vechile_categories/agricultural/agricultural_tabbar_view.dart';
import 'package:testt/src/features/home/vechile_categories/reuseable_tabbar_view.dart/reuseable_tabbar_provider.dart';

class AgriculturalTab extends StatelessWidget {
  const AgriculturalTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 5;
    var width = MediaQuery.of(context).size.width / 3;
    final categories = [
      {
        'image': 'assets/images/agricultural/agricultural_1.png',
        'text': 'Tractors',
        'color': '0xFFe4e5ed', // Light Pink
      },
      {
        'image': 'assets/images/agricultural/agricultural_2.png',
        'text': 'Threshers',
        'color': '0xFFf8f0e0', // Light Cyan
      },
      {
        'image': 'assets/images/agricultural/agricultural_3.png',
        'text': 'Harvesters',
        'color': '0xFFf2f1f3', // Light Orange
      },
      {
        'image': 'assets/images/agricultural/agricultural_4.png',
        'text': 'Seeders',
        'color': '0xFFe7e8ee', // Light Green
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
            height: height * 0.6,
            child: PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              itemBuilder: (context, pageIndex) {
                final pageCategories = pages[pageIndex];
                return Center(
                  child: Wrap(
                    spacing: width * 0.04,
                    children: pageCategories
                        .asMap()
                        .map((categoryIndex, category) {
                          return MapEntry(
                            categoryIndex,
                            InkWell(
                              onTap: () {
                                print(
                                    '${category['text']} tapped and category index is $categoryIndex');
                                context
                                    .read<ReusableTabBarProvider>()
                                    .setTabIndex(categoryIndex);

                                Navigator.push(
                                  context,
                                  SlideTransitionPage(
                                      page: AgriculturalTabbarView()),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 8),
                                width: (context.mediaQueryWidth - 29) / 4,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                      color: Colors.grey.shade300, width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: Color(
                                              int.parse(category['color']!)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                      SizedBox(
                                          height:
                                              context.mediaQueryHeight / 150),
                                      Text(
                                        category['text']!,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: height * 0.06,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              context.mediaQueryHeight / 150),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
                        .values
                        .toList(),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 12.h),
          buildSectionHeader(context,
              title: 'Agriculture Machine for Sale ', onViewAllPressed: () {}),
          VechileHorizantalCard(
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
          vechileCard2(context, newsItems),
          Padding(padding: EdgeInsets.only(bottom: 50.sp))
        ],
      ),
    );
  }
}
