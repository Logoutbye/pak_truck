import 'package:flutter/material.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/home/view/ad_details_screen.dart';
import 'package:testt/src/features/my_profile/widget/my_ads_widget.dart';

Widget buildSectionHeader(
  BuildContext context, {
  required String title,
  required VoidCallback onViewAllPressed,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Themetext.blackBoldText.copyWith(fontSize: 20)),
        GestureDetector(
            onTap: onViewAllPressed,
            child: Text('View All',
                style: Themetext.blackBoldText
                    .copyWith(color: AppColors.primaryColor))),
      ],
    ),
  );
}

Widget buildHorizontalList(BuildContext context, bool byPaktruck) {
  final items = [
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Dumper Truck',
      'price': 'PKR. 3,800,000',
      'location': 'Islamabad'
    },
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Automatic Truck',
      'price': 'PKR. 3,800,000',
      'location': 'Lahore'
    },
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Box Truck',
      'price': 'PKR. 3,800,000',
      'location': 'Karachi'
    },
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Dumper Truck',
      'price': 'PKR. 3,800,000',
      'location': 'Islamabad'
    },
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Automatic Truck',
      'price': 'PKR. 3,800,000',
      'location': 'Lahore'
    },
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Box Truck',
      'price': 'PKR. 3,800,000',
      'location': 'Karachi'
    },
  ];

  return SizedBox(
    // height: 220,
    height: context.mediaQueryHeight / 4.2,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          // width: 160,
          width: context.mediaQueryWidth / 2.4,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Image.asset(
                  item['image']!,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: context.mediaQueryHeight / 100),
                    Text(item['price']!,
                        style: Themetext.blackBoldText
                            .copyWith(color: AppColors.primaryColor)),
                    SizedBox(height: context.mediaQueryHeight / 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['location']!,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        if (byPaktruck)
                          Text(
                            'By PakTruck ',
                            style: TextStyle(
                                color: AppColors.orange, fontSize: 12),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget buildVerticalList(BuildContext context) {
  final items = [
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Dumper Truck',
      'description':
          'Pakistan is making significant strides towards a greener and more...',
    },
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Automatic Truck',
      'description':
          'Pakistan is making significant strides towards a greener and more...',
    },
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Box Truck',
      'description':
          'Pakistan is making significant strides towards a greener and more...',
    },
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Dumper Truck',
      'description':
          'Pakistan is making significant strides towards a greener and more...',
    },
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Automatic Truck',
      'description':
          'Pakistan is making significant strides towards a greener and more...',
    },
    {
      'image': 'assets/images/mini_truck.png',
      'title': 'Box Truck',
      'description':
          'Pakistan is making significant strides towards a greener and more...',
    },
  ];

  return ListView.builder(
    shrinkWrap: true,
    // physics: NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              SlideTransitionPage(
                  page: AdDetailScreen(
                ad: dummyAds.first,
              )));
        },
        child: Container(
          width: context.mediaQueryWidth / 2.4,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: context.mediaQueryWidth / 2.5,
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Image.asset(
                  item['image']!,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: context.mediaQueryHeight / 100),
                    SizedBox(
                      width: context.mediaQueryWidth / 2,
                      child: Text(
                        item['description']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget buildSparePartsList() {
  final spareParts = [
    'Body Part',
    'Crush Plant',
    'Hydraulic Pump',
    'Cabin',
    'Hydraulic Jack',
    'Excavator Boom',
    'Engine',
    'Boozer\nCompressor',
    'Loader Bucket',
  ];

  // Group spare parts into rows of three
  List<List<String>> groupedParts = [];
  for (int i = 0; i < spareParts.length; i += 3) {
    groupedParts.add(spareParts.sublist(
      i,
      (i + 3) > spareParts.length ? spareParts.length : i + 3,
    ));
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groupedParts.map((row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: row.map((part) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      part,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    ),
  );
}

Widget buildBudgetList() {
  final spareParts = [
    'under 5 lakh',
    '5 - 1.5 crore',
    '10 - 20 lakh',
    '30-40 lakh',
    '40 - 50 lakh',
    '50 - 60 crore',
    '80 lakh-1 crore',
    '1 - 1.5 crore',
    '1.5 2 crore',
  ];

  // Group spare parts into rows of three
  List<List<String>> groupedParts = [];
  for (int i = 0; i < spareParts.length; i += 3) {
    groupedParts.add(spareParts.sublist(
      i,
      (i + 3) > spareParts.length ? spareParts.length : i + 3,
    ));
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groupedParts.map((row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: row.map((part) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      part,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    ),
  );
}

Widget buildModelList() {
  final spareParts = [
    'Corolla',
    'Civic',
    'City',
    'Camry',
    'Vitz',
    'Swift',
    'Sportage',
    'Fortuner',
    'Hilux',
    'Land\nCruiser',
    'Prado',
    'Mustang',
    'Accord',
    'Altis',
    'Mehran',
    'Cultus',
  ];

  // Group spare parts into rows of three
  List<List<String>> groupedParts = [];
  for (int i = 0; i < spareParts.length; i += 4) {
    groupedParts.add(spareParts.sublist(
      i,
      (i + 4) > spareParts.length ? spareParts.length : i + 4,
    ));
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: groupedParts.map((row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: row.map((part) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        part,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    ),
  );
}

Widget buildCityList() {
  final spareParts = [
    'Karachi',
    'Lahore',
    'Islamabad',
    'Rawalpindi',
    'Peshawar',
    'Quetta',
    'Faisalabad',
    'Multan',
    'Gujranwala',
    'Sialkot',
    'Hyderabad',
    'Sukkur',
    'Bahawalpur',
    'Sargodha',
    'Abbottabad',
  ];

  // Group spare parts into rows of three
  List<List<String>> groupedParts = [];
  for (int i = 0; i < spareParts.length; i += 4) {
    groupedParts.add(spareParts.sublist(
      i,
      (i + 4) > spareParts.length ? spareParts.length : i + 4,
    ));
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: groupedParts.map((row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: row.map((part) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        part,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    ),
  );
}

Widget buildPaktruckBrandsList(BuildContext context) {
  final brands = [
    {'name': 'Hino', 'icon': 'assets/images/hino.png'},
    {'name': 'Isuzu', 'icon': 'assets/images/isuzu.png'},
    {'name': 'Tata', 'icon': 'assets/images/tata.png'},
    {'name': 'Sinotruk', 'icon': 'assets/images/sinotruk.png'},
    {'name': 'Kamaz', 'icon': 'assets/images/kamaz.png'},
    {'name': 'JAC', 'icon': 'assets/images/jac.png'},
    {'name': 'Scania', 'icon': 'assets/images/scania.png'},
    {'name': 'Kamaz', 'icon': 'assets/images/kamaz.png'},
    {'name': 'FAW Pakistan', 'icon': 'assets/images/faw.png'},
  ];

  // Group brands into rows of three
  List<List<Map<String, String>>> groupedBrands = [];
  for (int i = 0; i < brands.length; i += 3) {
    groupedBrands.add(brands.sublist(
      i,
      (i + 3) > brands.length ? brands.length : i + 3,
    ));
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: groupedBrands.map((row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: row.map((brand) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        brand['icon']!,
                        height: 30, // Adjust the size of the icon
                        width: 30,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: context.mediaQueryWidth / 6,
                        child: Text(
                          brand['name']!,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    ),
  );
}
