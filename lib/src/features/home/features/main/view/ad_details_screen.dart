import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/home/features/main/widget/ad_image_card.dart';
import 'package:testt/src/features/home/features/main/widget/truck_features_widget.dart';
import 'package:testt/src/features/sell/model/sell_truck_model/sell_truck_model.dart';

class AdDetailScreen extends StatelessWidget {
  final SellTruckModel ad;

  const AdDetailScreen({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: const Text(
          'My Ads',
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
                  AdImageCard(images: ad.truckImages),

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
                          ad.category,
                          // 'Truck Swift DLX Automatic 1.3 2024',
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
                  SizedBox(height: context.mediaQueryHeight / 35),

                  Row(
                    children: [
                      Text(
                        // 'PKR, 22 Lack',
                        ad.price.toString(),
                        style: Themetext.superHeadline
                            .copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                  SizedBox(height: context.mediaQueryHeight / 75),
                  Text(ad.description
                      // 'Lorem ipsum dolor sit amet consectetur. Sagittis facilisis augue posuere eu iaculis est.',
                      ),
                ],
              ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // _iconWithText('assets/svg/calender.svg', ad.truckYear),
                      _iconWithText(
                          'assets/svg/milleage.svg', ad.engineMileage),
                      _iconWithText(
                          'assets/svg/engine_type.svg', ad.engineType),
                      _iconWithText('assets/svg/transmission_type.svg',
                          ad.transmissionType),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _truckDetailItem('Registered in', ad.registeredIn),
                  // _truckDetailItem('Brand', ad.truckMake),
                  _truckDetailItem('Model', ad.truckModel),
                  _truckDetailItem('Color Pilers', ad.color),
                  _truckDetailItem('Body Type', 'N/A'),
                  _truckDetailItem('Engine Capacity', ad.engineCapacity),
                  _truckDetailItem('Last update', '11 Nov, 2024'),
                  _truckDetailItem('Ad Ref', '9236459'),
                  _truckDetailItem('Assembly', 'Imported'),
                  Divider(color: Colors.grey[300]),
                ],
              ),
            ),

            TruckFeaturesWidget(
              // featureNames: [
              //   "ABS",
              //   "Air Bags",
              //   "Alloy Rims",
              //   "CD Player",
              //   "Immobilizer Key",
              //   "Keyless Entry",
              //   "Power Locks",
              //   "Power Mirrors",
              //   "Power Steering",
              //   "Power Windows",
              //   'Air Conditioning',
              //   "AM/FM Radio",
              // ],
              featureNames: ad.selectedFeatures,
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
    return Column(
      children: [
        SvgPicture.asset(
          icon,
        ),
        const SizedBox(height: 4),
        Text(text,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
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
