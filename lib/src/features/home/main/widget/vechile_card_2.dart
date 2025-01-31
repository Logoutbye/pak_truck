import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';

Widget vechileCard2(BuildContext context, List<Map<String, String>> items) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Wrap(
      spacing: 8.0, // Horizontal spacing between cards
      runSpacing: 8.0, // Vertical spacing between rows
      children: items.map((item) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: context.mediaQueryWidth / 3,
                  margin: const EdgeInsets.all(2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      item['image']!,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Text Content
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['title']!,
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            SvgPicture.asset(
                                // 'assets/svg/heart_filled.svg',
                                'assets/svg/heart.svg',
                                height: context.mediaQueryHeight / 41,
                                color: Colors.black),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'PKR. 62.00 lac',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/truck_im.svg',
                              height: context.mediaQueryHeight / 41,
                            ),
                            SizedBox(width: 10.sp),
                            Text('2014'),
                            SizedBox(width: 10.sp),
                            Text(
                              '●',
                              style: TextStyle(
                                  fontSize: 8.sp, color: AppColors.grey),
                            ),
                            SizedBox(width: 10.sp),
                            Text(
                              'Imported',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    ),
  );
}
