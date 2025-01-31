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
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image.network(
                              images.first,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
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
                                // borderRadius: BorderRadius.circular(25.0),
                                child: Image.asset(
                                  provider.currentImage,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // Image Counter

                              // Positioned(
                              //   top: 0,
                              //   right: 0,
                              //   child: Container(
                              //     padding: const EdgeInsets.symmetric(
                              //         vertical: 10, horizontal: 12),
                              //     decoration: const BoxDecoration(
                              //       color: Colors.white,
                              //       borderRadius: BorderRadius.only(
                              //           bottomLeft: Radius.circular(25),
                              //           topRight: Radius.circular(25)),
                              //     ),
                              //     child: Row(
                              //       children: [
                              //         Text(
                              //           // "${provider.currentIndex + 1} /

                              //           " ${provider.totalImages}",
                              //           style: const TextStyle(
                              //             fontSize: 14,
                              //             fontWeight: FontWeight.bold,
                              //             color: Colors.black,
                              //           ),
                              //         ),
                              //         const SizedBox(width: 4),
                              //         Image.asset(
                              //           'assets/images/list_of_images.png',
                              //           width: 30,
                              //           height: 30,
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
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
                width: 30.h,
                height: 30.h,
                child: CustomBackButton())),
        Positioned(
            top: 40.sp,
            right: 10.sp,
            child: Container(
                margin: EdgeInsets.all(8),
                width: 30.h,
                height: 30.h,
                child: CustomBackButton())),
        Positioned(
            top: 40.sp,
            right: 50.sp,
            child: Container(
                margin: EdgeInsets.all(8),
                width: 30.h,
                height: 30.h,
                child: CustomBackButton())),
      ],
    );
  }
}
