import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';

class VechileCard extends StatelessWidget {
  final List<Map<String, String>> items;
  final double height;
  final bool showPakTruckTag;
  final double imageHeightRatio;
  final double cardWidthRatio;

  const VechileCard({
    super.key,
    required this.items,
    this.height = 200, 
    this.showPakTruckTag = false, 
    this.imageHeightRatio = 0.5,
    this.cardWidthRatio = 0.6, 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height != 200 ? height : context.mediaQueryHeight / 5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _buildListItem(context, item);
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Map<String, String> item) {
    final cardWidth = MediaQuery.of(context).size.width * cardWidthRatio;
    final imageHeight = height * imageHeightRatio;

    return Container(
      width: cardWidth,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container with Rounded Borders
          if (item['image'] != null && item['image']!.isNotEmpty)
            Container(
              margin: const EdgeInsets.all(4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  item['image']!,
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          SizedBox(height: 8.h),
          // Item Details
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.sp),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (item['price'] != null && item['price']!.isNotEmpty)
                      Text(
                        item['price']!,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
                      ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
