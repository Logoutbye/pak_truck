// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/home/main/view/spare_part_details_screen.dart';
import 'package:testt/src/model/spare_parts/spare_parts_model.dart';

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
class SavedAdsWidget extends StatelessWidget {
  SavedAdsWidget({super.key});

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
      padding: EdgeInsets.symmetric(horizontal: 4),
      children: [
        SizedBox(height: context.mediaQueryHeight / 30),
        Text(
          'Your Posts',
          style: Themetext.headline.copyWith(color: AppColors.primary),
        ),
        SizedBox(height: 16),

        // Step 3: Use Post model data to display the list of posts
        ...posts.map((post) => PostCard(post: post)).toList(),
      ],
    );
  }
}

final List<SparePartsModel> dummySparePartsList = [
  SparePartsModel(
    images: [
      'assets/images/truck.png',
      'assets/images/remove_me1.png',
      'assets/images/description.png',
    ],
    location: 'Karachi, Sindh',
    price: 'PKR 5,000',
    title: 'Brake Pads for Toyota Corolla',
    description: 'High-quality brake pads for Toyota Corolla 2015-2020 model.',
    sellerName: 'Ali Autos',
    mobileNumber: '0312-3456789',
    address: 'Auto Parts Market, Karachi',
    comments: 'Brand new and reliable parts, available for immediate delivery.',
    allowWhatsappContact: true,
  ),
  SparePartsModel(
    images: [
      'assets/images/truck.png',
      'assets/images/remove_me1.png',
      'assets/images/description.png',
    ],
    location: 'Lahore, Punjab',
    price: 'PKR 12,000',
    title: 'Genuine Honda Civic Air Filter',
    description:
        'Original air filter for Honda Civic 2016-2022, improves engine performance.',
    sellerName: 'Honda Spare Mart',
    mobileNumber: '0301-9876543',
    address: 'Johar Town, Lahore',
    comments: 'Limited stock available. Best price guaranteed!',
    allowWhatsappContact: true,
  ),
  SparePartsModel(
    images: [
      'assets/images/truck.png',
      'assets/images/remove_me1.png',
      'assets/images/description.png',
    ],
    location: 'Islamabad',
    price: 'PKR 8,500',
    title: 'LED Headlights for Suzuki Swift',
    description:
        'Energy-efficient LED headlights for Suzuki Swift 2018-2023 models.',
    sellerName: 'Swift Auto Lights',
    mobileNumber: '0345-1122334',
    address: 'Blue Area, Islamabad',
    comments: 'Free installation on purchase. Limited-time offer.',
    allowWhatsappContact: false,
  ),
  SparePartsModel(
    images: [
      'assets/images/truck.png',
      'assets/images/remove_me1.png',
      'assets/images/description.png',
    ],
    location: 'Faisalabad',
    price: 'PKR 2,500',
    title: 'Engine Oil Filter for Suzuki Mehran',
    description: 'Premium oil filter to enhance engine lifespan for Mehran.',
    sellerName: 'Mehran Parts House',
    mobileNumber: '0333-4455667',
    address: 'D Ground Market, Faisalabad',
    comments: 'Bulk purchase discount available.',
    allowWhatsappContact: true,
  ),
  SparePartsModel(
    images: [
      'assets/images/truck.png',
      'assets/images/remove_me1.png',
      'assets/images/description.png',
    ],
    location: 'Peshawar',
    price: 'PKR 7,000',
    title: 'Car Battery - 12V for Suzuki Alto',
    description: 'Maintenance-free 12V battery for Suzuki Alto 2020 model.',
    sellerName: 'Auto Energy Batteries',
    mobileNumber: '0314-2233445',
    address: 'Khyber Bazaar, Peshawar',
    comments: 'Free delivery within Peshawar city.',
    allowWhatsappContact: false,
  ),
];

// Reusable Post Card Widget
class PostCard extends StatelessWidget {
  final Post post; // Accepting Post model
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SpartPartDetailScreen(
                sparePart: dummySparePartsList.first,
              ),
            ));
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
