// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/loading_widget.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/data/response/status.dart';
import 'package:testt/src/features/home/main/view/ad_details_screen.dart';
import 'package:testt/src/features/home/main/view_model/vechile_ads_view_model.dart';

class MyAdsWidget extends StatelessWidget {
  Widget headingWidget;
  MyAdsWidget({super.key, required this.headingWidget});

  @override
  Widget build(BuildContext context) {
    return Consumer<VechileAdsViewModel>(
      builder:
          (BuildContext context, VechileAdsViewModel value, Widget? child) {
        final myAds = value.myAds;

        switch (myAds.status) {
          case Status.notStarted:
            Future.microtask(() {
              value.fetchMyAds();
            });
            return const Center(child: LoadingWidget());
          case Status.loading:
            return const Center(child: LoadingWidget());
          case Status.error:
            final errorMessage =
                value.myAds.message?.toString() ?? "Unknown error";
            return Center(child: Text(errorMessage));

          case Status.completed:
            final trucks = myAds.data ?? [];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headingWidget,
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: trucks.length,
                    itemBuilder: (context, index) {
                      final truck = trucks[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              SlideTransitionPage(
                                  page: AdDetailScreen(ad: truck)));
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 14),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                // Post Image with rounded border
                                if (truck.truckImages.isNotEmpty)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      truck.truckImages.first,
                                      width: context.mediaQueryWidth / 4,
                                      height: context.mediaQueryHeight / 8,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                if (truck.truckImages.isEmpty)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: SvgPicture.asset(
                                      'assets/svg/plaeholder.svg',
                                      width: context.mediaQueryWidth / 4,
                                      height: context.mediaQueryHeight / 8,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                SizedBox(width: 16),
                                // Post Info: Title, Price, Stats
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Title
                                      Text(
                                        truck.category,
                                        style: Themetext.headline.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                          height:
                                              context.mediaQueryHeight / 45),
                                      // Price
                                      Text(
                                        truck.price.toString(),
                                        style: Themetext.blackBoldText
                                            .copyWith(color: AppColors.primary),
                                      ),
                                      SizedBox(
                                          height:
                                              context.mediaQueryHeight / 45),
                                      // Stats: Chat Count, Views Count, Calls Count
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          StatItem(label: 'Views', value: 12),
                                          StatItem(label: 'Calls', value: 12),

                                          StatItem(label: 'Chats', value: 12),
                                          // "See My Ad" Text Button
                                          Row(
                                            children: [
                                              Text(
                                                'See My Ad',
                                                style: Themetext.blackBoldText
                                                    .copyWith(
                                                        color:
                                                            AppColors.primary,
                                                        fontSize: 12),
                                              ),
                                              SizedBox(width: 5),
                                              SvgPicture.asset(
                                                'assets/svg/arrow-right.svg',
                                                // ignore: deprecated_member_use
                                                color: AppColors.primary,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );

          default:
            return Container();
        }
      },
    );
  }
}

// Reusable Stat Item Widget for Chat, Views, and Calls
class StatItem extends StatelessWidget {
  final String label;
  final int value;

  const StatItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$value',
          style: Themetext.blackBoldText
              .copyWith(fontWeight: FontWeight.normal, fontSize: 12),
        ),
        SizedBox(width: 4),
        SvgPicture.asset(
          label == 'Chats'
              ? 'assets/svg/chat.svg'
              : label == 'Views'
                  ? 'assets/svg/eye.svg'
                  : label == 'Calls'
                      ? 'assets/svg/call.svg'
                      : '',
          height: context.mediaQueryHeight / 50,
        )
      ],
    );
  }
}
