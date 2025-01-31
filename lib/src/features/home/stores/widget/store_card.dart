import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/features/home/stores/view/stores_ads_screen.dart';

class StoreCard extends StatelessWidget {
  final List<Map<String, String>> items;
  final double height;
  final bool showPakTruckTag;
  final bool heartButton;
  final double imageHeightRatio;
  final double cardWidthRatio;

  const StoreCard({
    super.key,
    required this.items,
    this.height = 200,
    this.showPakTruckTag = false,
    this.heartButton = false,
    this.imageHeightRatio = 0.8,
    this.cardWidthRatio = 0.6,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _buildListItem(context, item);
      },
    );
  }

  Widget _buildListItem(BuildContext context, Map<String, String> item) {
    final cardWidth = MediaQuery.of(context).size.width * cardWidthRatio;
    final imageHeight = height * imageHeightRatio;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            SlideTransitionPage(
                page: StoresAdsScreen(
              title: 'Auto Store',
            )));
      },
      child: Container(
        width: cardWidth,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Container with Rounded Borders
                if (item['image'] != null && item['image']!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      item['image']!,
                      height: imageHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                SizedBox(height: 8.h),
                // Item Details
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item['title'] != null && item['title']!.isNotEmpty)
                        Text(
                          item['title']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (item['title'] != null && item['title']!.isNotEmpty)
                        SizedBox(height: context.mediaQueryHeight / 75),
                      if (item['location'] != null &&
                              item['location']!.isNotEmpty ||
                          showPakTruckTag)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (item['location'] != null &&
                                item['location']!.isNotEmpty)
                              Row(
                                children: [
                                  SvgPicture.asset('assets/svg/location.svg'),
                                  SizedBox(width: 2.sp),
                                  Text(
                                    item['location']!,
                                  ),
                                ],
                              ),
                          ],
                        )
                    ],
                  ),
                ),
              ],
            ),
           
           if(heartButton)
            Positioned(
                right: 0,
                child: GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(6.sp),
                    padding: EdgeInsets.all(9.sp),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.white),
                    child: SvgPicture.asset(
                      'assets/svg/heart.svg',
                      height: 20.h,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
