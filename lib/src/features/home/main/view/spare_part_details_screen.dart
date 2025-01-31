import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/home/main/widget/ad_image_card.dart';
import 'package:testt/src/model/spare_parts/spare_parts_model.dart';

class SpartPartDetailScreen extends StatelessWidget {
  final SparePartsModel sparePart;

  const SpartPartDetailScreen({super.key, required this.sparePart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: const Text(
          'My Spare Part',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Manage Ads Section
            Container(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
              child: Column(
                children: [
                  AdImageCard(images: sparePart.images!),

                  SizedBox(height: context.mediaQueryHeight / 35),
                  // Title & Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: context.mediaQueryWidth / 2),
                        child: Text(
                          sparePart.title,
                          style: Themetext.headline.copyWith(fontSize: 16),
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
                  SizedBox(height: context.mediaQueryHeight / 75),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/eye.svg',
                        color: AppColors.orange,
                        height: context.mediaQueryHeight / 35,
                      ),
                      SizedBox(width: context.mediaQueryWidth / 41),
                      Text(
                        'New',
                        style: Themetext.headline.copyWith(
                            color: AppColors.orange,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: context.mediaQueryHeight / 75),

                  Row(
                    children: [
                      Text(
                        sparePart.price.toString(),
                        style: Themetext.superHeadline
                            .copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                  SizedBox(height: context.mediaQueryHeight / 35),

                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/location.svg'),
                      SizedBox(width: 8),
                      Text(
                        sparePart.location,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: context.mediaQueryHeight / 35),
                  Row(
                    children: [
                      Text('About This Item', style: Themetext.headline),
                    ],
                  ),
                  SizedBox(height: context.mediaQueryHeight / 75),
                  Text(sparePart.description),
                  SizedBox(height: context.mediaQueryHeight / 75),

                  Divider(color: Colors.grey[400]),

                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/comment.svg'),
                      SizedBox(width: 10),
                      Text(
                        'Seller Comments',
                        style: Themetext.subheadline
                            .copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(sparePart.sellerName),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: context.mediaQueryHeight / 35),
          ],
        ),
      ),
    );
  }
}
