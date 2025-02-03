import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/home/main/widget/ad_image_card.dart';
import 'package:testt/src/model/truck_model/truck_model.dart';

class MyAdDetailScreen extends StatelessWidget {
  final TruckModel ad;

  const MyAdDetailScreen({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(),
            // Manage Ads Section
            Column(
              children: [
                AdImageCard(images: ad.truckImages),

                SizedBox(height: context.mediaQueryHeight / 35),

                // Title & Price
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: context.mediaQueryWidth / 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ad.category,
                              style: Themetext.headline.copyWith(fontSize: 16),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              ad.createdAt.toDateAndMonth(),
                              style: Themetext.headline.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Ad View',
                            style: Themetext.headline.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: context.mediaQueryWidth / 41),
                          Text(
                            1999299.viewCountFormatted,
                            style: Themetext.headline.copyWith(
                                color: AppColors.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: context.mediaQueryWidth / 41),
                          SvgPicture.asset(
                            'assets/svg/eye.svg',
                            color: AppColors.primary,
                            height: context.mediaQueryHeight / 35,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: context.mediaQueryHeight / 35),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'PKR, ${ad.price}',
                        style: Themetext.superHeadline
                            .copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.mediaQueryHeight / 75),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.sp),
                      child: Text(ad.description),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: context.mediaQueryHeight / 35),

            // Truck Detail Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Truck Detail', style: Themetext.headline),
                  SizedBox(height: context.mediaQueryHeight / 75),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _iconWithText(
                          'assets/svg/calender.svg', ad.modelYear.toString()),
                      SizedBox(width: 20.w),
                      _iconWithText('assets/svg/location.svg', ad.location),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _truckDetailItem('Engine Capacity', ad.engineType),
                  _truckDetailItem('Category', ad.category),
                  _truckDetailItem('Sub Category', ad.subCategory),
                  _truckDetailItem('Registered in', ad.registeredIn),
                  _truckDetailItem('Assembly', ad.localOrImported),
                  _truckDetailItem('Model Year', ad.modelYear.toString()),
                  _truckDetailItem('Brand', ad.make),
                  _truckDetailItem(
                      'Created At', ad.createdAt.toFormattedDate()),
                  Divider(color: Colors.grey[300]),
                ],
              ),
            ),

            // Bottom Actions

            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomSheet: _bottomSheet(),
    );
  }

  Widget _iconWithText(String icon, String text) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 20.sp,
        ),
        SizedBox(width: 8.sp),
        Text(text,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp)),
      ],
    );
  }

  Widget _truckDetailItem(String title, String value) {
    return Column(
      children: [
        Divider(
          color: Colors.grey[300],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black54)),
              Text(value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black54)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bottomSheet() {
    return Container(
      padding:
          const EdgeInsets.only(left: 12.0, right: 12, bottom: 30, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/edit.svg'),
                const SizedBox(width: 6),
                Text('Edit',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/done.svg'),
                const SizedBox(width: 6),
                Text('Mark as Sold',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/trash.svg'),
                const SizedBox(width: 6),
                Text('Remove your ad',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
