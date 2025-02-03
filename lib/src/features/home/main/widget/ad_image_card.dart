import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/custom_back_button.dart';

import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/home/main/view_model/ad_image_provider.dart';

class AdImageCard extends StatelessWidget {
  final List<String> images;

  const AdImageCard({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: images.length <= 1
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    images.isEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: SvgPicture.asset(
                              'assets/svg/plaeholder.svg',
                              width: double.infinity,
                              height: 350.sp,
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image.network(
                              images.first,
                              width: double.infinity,
                              height: 200.sp,
                              fit: BoxFit.fill,
                            ),
                          ),
                  ],
                )
              : ChangeNotifierProvider(
                  create: (_) => AdImageProvider(images),
                  child: Consumer<AdImageProvider>(
                    builder: (context, provider, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image Display with Counter
                          Stack(
                            children: [
                              // Image
                              ClipRRect(
                                child: Image.asset(
                                  provider.currentImage,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),

                          // Title and Navigation Buttons
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Manage this Ads',
                                    style: Themetext.headline),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: provider.previousImage,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: SvgPicture.asset(
                                          'assets/svg/arrow_back.svg',
                                          color: provider.currentIndex > 0
                                              ? AppColors.primary
                                              : Colors.grey,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: provider.nextImage,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: SvgPicture.asset(
                                          'assets/svg/arrow_right.svg',
                                          color: provider.currentIndex <
                                                  provider.totalImages - 1
                                              ? AppColors.primary
                                              : Colors.grey,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
        ),
        Positioned(
            top: 40.sp,
            child: Container(
                margin: EdgeInsets.all(8),
                width: 35.h,
                height: 35.h,
                child: CustomBackButton())),
        Positioned(
            top: 40.sp,
            right: 50.sp,
            child: Container(
                margin: EdgeInsets.all(8),
                width: 30.h,
                height: 30.h,
                child: GestureDetector(
                  // onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(4.sp),
                    margin: EdgeInsets.all(2.sp),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.white),
                    child: SvgPicture.asset('assets/svg/heart.svg'),
                  ),
                ))),
        Positioned(
            top: 40.sp,
            right: 10.sp,
            child: Container(
                margin: EdgeInsets.all(8),
                width: 30.h,
                height: 30.h,
                child: GestureDetector(
                  // onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: EdgeInsets.all(3.sp),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.white),
                    child: Icon(Icons.share),
                  ),
                ))),
      ],
    );
  }
}
