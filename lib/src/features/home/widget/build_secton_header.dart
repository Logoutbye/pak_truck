import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/theme/theme_text.dart';

Widget buildSectionHeader(BuildContext context,
    {required String title,
    required VoidCallback onViewAllPressed,
    bool hasViewAll = true}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Themetext.blackBoldText
                .copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp)),
        if (hasViewAll)
          InkWell(
              onTap: onViewAllPressed,
              child: Text('View All',
                  style: Themetext.blackBoldText
                      .copyWith(fontSize: 10.sp, color: AppColors.primary))),
      ],
    ),
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
