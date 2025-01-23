// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/home/view/ad_details_screen.dart';
import 'package:testt/src/features/sell/model/sell_truck_model/sell_truck_model.dart';

// Step 1: Define a Post model class
class Post {
  final String image;
  final String title;
  final String price;
  final int chatCount;
  final int viewsCount;
  final int callsCount;

  Post({
    required this.image,
    required this.title,
    required this.price,
    required this.chatCount,
    required this.viewsCount,
    required this.callsCount,
  });
}

// Step 2: Create a list of Post objects
// ignore: must_be_immutable
class MyAdsWidget extends StatelessWidget {
  Widget headingWidget;
  MyAdsWidget({super.key, required this.headingWidget});

  final List<Post> posts = [
    Post(
      image: 'assets/images/splash.png',
      title: 'Luxury Car for Sale',
      price: '\$25,000',
      chatCount: 10,
      viewsCount: 200,
      callsCount: 5,
    ),
    Post(
      image: 'assets/images/splash.png',
      title: 'House for Rent',
      price: '\$1,500/month',
      chatCount: 5,
      viewsCount: 150,
      callsCount: 2,
    ),
    Post(
      image: 'assets/images/splash.png',
      title: 'Used Laptop',
      price: '\$300',
      chatCount: 20,
      viewsCount: 500,
      callsCount: 8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      // physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 14),
      children: [
        headingWidget,
        SizedBox(height: 16),

        // Step 3: Use Post model data to display the list of posts
        ...posts.map((post) => PostCard(post: post)).toList(),
      ],
    );
  }
}

// Reusable Post Card Widget
class PostCard extends StatelessWidget {
  final Post post; // Accepting Post model
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            SlideTransitionPage(
                page: AdDetailScreen(
              ad: dummyAds.first,
            )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  post.image,
                  width: context.mediaQueryWidth / 4,
                  height: context.mediaQueryHeight / 8,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              // Post Info: Title, Price, Stats
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      post.title,
                      style: Themetext.headline
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: context.mediaQueryHeight / 45),
                    // Price
                    Text(
                      post.price,
                      style: Themetext.blackBoldText
                          .copyWith(color: AppColors.primary),
                    ),
                    SizedBox(height: context.mediaQueryHeight / 45),
                    // Stats: Chat Count, Views Count, Calls Count
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatItem(label: 'Views', value: post.viewsCount),
                        StatItem(label: 'Calls', value: post.callsCount),

                        StatItem(label: 'Chats', value: post.chatCount),
                        // "See My Ad" Text Button
                        Row(
                          children: [
                            Text(
                              'See My Ad',
                              style: Themetext.blackBoldText.copyWith(
                                  color: AppColors.primary, fontSize: 12),
                            ),
                            SizedBox(width: 5),
                            SvgPicture.asset(
                              'assets/svg/arrow-right.svg',
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
  }
}

// Simulated dummy API data
final List<SellTruckModel> dummyAds = [
  SellTruckModel(
    truckImages: [
      'assets/images/truck.png',
      'assets/images/remove_me1.png',
      'assets/images/description.png',
    ],
    truckVideo: 'assets/videos/truck_video.mp4',
    price: 'PKR, 22 Lack',
    location: 'Karachi, Sindh',
    category: 'Heavy Duty Truck',
    registeredIn: 'Sindh',
    truckYear: '2024',
    truckMake: 'Hino Pakistan',
    description:
        'Lorem ipsum dolor sit amet consectetur. Sagittis facilisis augue posuere eu iaculis est.',
    truckModel: 'Hino 500',
    color: 'Green Orange',
    engineType: 'Petrol',
    engineCapacity: '1000 (cc)',
    engineMileage: '103,950 km',
    transmissionType: 'Automatic',
    selectedFeatures: [
      "ABS",
      "Air Bags",
      "Alloy Rims",
      "CD Player",
      "Immobilizer Key",
      "Keyless Entry",
      "Power Locks",
      "Power Mirrors",
      "Power Steering",
      "Power Windows",
      "Air Conditioning",
      "AM/FM Radio",
    ],
    sellerName: 'John Doe',
    mobileNumber: '0300-1234567',
    address: '123 Main Street, Karachi',
    comments: 'Great truck, well maintained!',
  ),
  SellTruckModel(
    truckImages: [
      'assets/images/truck.png',
      'assets/images/description.png',
    ],
    price: 'PKR, 18 Lack',
    description:
        'Lorem ipsum dolor sit amet consectetur. Sagittis facilisis augue posuere eu iaculis est.',
    location: 'Lahore, Punjab',
    category: 'Medium Duty Truck',
    registeredIn: 'Punjab',
    truckYear: '2022',
    truckMake: 'Isuzu',
    truckModel: 'Isuzu N-Series',
    color: 'White',
    engineType: 'Diesel',
    engineCapacity: '500 (cc)',
    engineMileage: '56,000 km',
    transmissionType: 'Manual',
    selectedFeatures: [
      "ABS",
      "Air Bags",
      "Power Steering",
      "Power Windows",
      "Air Conditioning",
    ],
    sellerName: 'Ali Khan',
    mobileNumber: '0301-7654321',
    address: '456 Lahore Road, Punjab',
    comments: 'Affordable price and in good condition!',
  ),
];

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
