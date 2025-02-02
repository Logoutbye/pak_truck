import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';

class VechileVerticalCard extends StatelessWidget {
  final List<Map<String, String>> items;

  final bool showPakTruckTag;
  final String title;
  final Function()? onSortingPressed;
  const VechileVerticalCard({
    super.key,
    required this.items,
    this.showPakTruckTag = false,
    required this.title,
    this.onSortingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: Themetext.superHeadline.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.w600)),
                  GestureDetector(
                    onTap: onSortingPressed,
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/filter.svg'),
                        SizedBox(width: 4.sp),
                        Text('Filter'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return _buildListItem(context, item);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Map<String, String> item) {
    return Container(
      width: 230.w,
      margin: EdgeInsets.all(8.sp),
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
                Container(
                  margin: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      item['image']!,
                      height: 90.h,
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
              SizedBox(height: 8.h),
            ],
          ),
          Positioned(
              right: 0,
              child: GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(8.sp),
                  padding: EdgeInsets.all(6.sp),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.white),
                  child: SvgPicture.asset('assets/svg/heart.svg', height: 18.h),
                ),
              ))
        ],
      ),
    );
  }
}
