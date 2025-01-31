// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:testt/src/configs/color/color.dart';
// import 'package:testt/src/features/home/view_model/new_tab_bar_notifier.dart';

final List<Map<String, String>> newsItems = [
  {
    'image': 'assets/images/remove_me1.png',
    'title': 'Latest Truck News',
    'description': 'The trucking industry is evolving rapidly...',
  },
  {
    'image': 'assets/images/remove_me2.png',
    'title': 'Fuel Efficiency Tips',
    'description': 'Discover how to maximize your truck\'s fuel efficiency...',
  },
  {
    'image': 'assets/images/remove_me1.png',
    'title': 'Latest Truck News',
    'description': 'The trucking industry is evolving rapidly...',
  },
  {
    'image': 'assets/images/remove_me2.png',
    'title': 'Fuel Efficiency Tips',
    'description': 'Discover how to maximize your truck\'s fuel efficiency...',
  },
];

// final List<Map<String, String>> reviewsItems = [
//   {
//     'image': 'assets/images/remove_me2.png',
//     'title': 'Fuel Efficiency Tips',
//     'description': 'Discover how to maximize your truck\'s fuel efficiency...',
//   },
//   {
//     'image': 'assets/images/remove_me1.png',
//     'title': 'Latest Truck News',
//     'description': 'The trucking industry is evolving rapidly...',
//   },
//   {
//     'image': 'assets/images/remove_me2.png',
//     'title': 'Fuel Efficiency Tips',
//     'description': 'Discover how to maximize your truck\'s fuel efficiency...',
//   },
// ];

// final List<Map<String, String>> discussionItems = [
//   {
//     'image': 'assets/images/remove_me1.png',
//     'title': 'Latest Truck News',
//     'description': 'The trucking industry is evolving rapidly...',
//   },
//   {
//     'image': 'assets/images/remove_me2.png',
//     'title': 'Fuel Efficiency Tips',
//     'description': 'Discover how to maximize your truck\'s fuel efficiency...',
//   },
// ];

// class CustomTabBar extends StatelessWidget {
//   final List<String> tabs;
//   const CustomTabBar({super.key, required this.tabs});

//   @override
//   Widget build(BuildContext context) {
//     final tabNotifier = context.watch<CustomTabBarNotifier>();

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: List.generate(tabs.length, (index) {
//         final isSelected = tabNotifier.currentIndex == index;

//         return GestureDetector(
//           onTap: () => context.read<CustomTabBarNotifier>().updateIndex(index),
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//             decoration: BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(
//                   color: isSelected
//                       ? AppColors.primaryColor // Change to your active color
//                       : Colors.transparent,
//                   width: 2,
//                 ),
//               ),
//             ),
//             child: Text(
//               tabs[index],
//               style: TextStyle(
//                 color: isSelected ? AppColors.primaryColor : Colors.grey,
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

// class CustomTabView extends StatelessWidget {
//   final List<Widget> children;
//   const CustomTabView({super.key, required this.children});

//   @override
//   Widget build(BuildContext context) {
//     final currentIndex = context.watch<CustomTabBarNotifier>().currentIndex;

//     return Stack(
//       children: List.generate(children.length, (index) {
//         return Visibility(
//           visible: index == currentIndex,
//           maintainState: true, // Keep the state of the invisible widgets
//           child: children[index],
//         );
//       }),
//     );
//   }
// }
