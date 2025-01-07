// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:testt/src/configs/color/color.dart';
// import 'package:testt/src/configs/extensions.dart';
// import 'package:testt/src/configs/theme/theme_text.dart';
// import 'package:testt/src/configs/utils.dart';
// import 'package:testt/src/features/home/widget/build_secton_header.dart';
// import 'package:testt/src/features/home/widget/shop_tabbar_view.dart';
// import 'package:testt/src/features/sell/widget/sell_textform_field.dart';

// import '../../my_profile/widget/user_image_avatar_widget.dart';
// import '../widget/category_tab.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
//   late TabController _categoryTabController;
//   late TabController _autoTabController;
//   late TabController _thirdTabController;
//   late TextEditingController searchTextEditingController;

//   @override
//   void initState() {
//     super.initState();
//     searchTextEditingController = TextEditingController();
//     _categoryTabController = TabController(length: 5, vsync: this);
//     _autoTabController = TabController(length: 3, vsync: this);
//     _thirdTabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     searchTextEditingController.dispose();
//     _categoryTabController.dispose();
//     _autoTabController.dispose();
//     _thirdTabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.all(4.0),
//           child: UserImageAvatarWidget(
//             imageUrl: '', // Ensure imageUrl is not null
//           ),
//         ),
//         title: Column(
//           children: [
//             SellTextFormField(
//               leading: Icon(Icons.search),
//               maxLines: 1,
//               minLines: 1,
//               color: AppColors.whiteColor,
//               borderColor: AppColors.dividerColor,
//               hintText: 'Search used Truck',
//               controller: searchTextEditingController,
//               titleText: '',
//             ),
//           ],
//         ),
//         actions: [
//           InkWell(
//             borderRadius: BorderRadius.circular(12),
//             onTap: () {
//               Utils.dismissKeyboard(context);
//             },
//             child: Container(
//               padding: EdgeInsets.all(8),
//               margin: EdgeInsets.all(2),
//               decoration: BoxDecoration(
//                 border: Border.all(color: AppColors.dividerColor, width: 2),
//                 borderRadius: BorderRadius.circular(12),
//                 color: AppColors.whiteColor,
//               ),
//               child: SvgPicture.asset('assets/svg/filter.svg'),
//             ),
//           ),
//           SizedBox(width: context.mediaQueryWidth / 90),
//         ],
//       ),
//       body: ListView(
//         children: [
//           SizedBox(height: context.mediaQueryHeight / 75),
//           buildSectionHeader(
//             context,
//             title: 'Browse Used Truck Category',
//             onViewAllPressed: () {},
//           ),
//           SizedBox(height: context.mediaQueryHeight / 75),
//           TabBar(
//             tabAlignment: TabAlignment.center,
//             controller: _categoryTabController,
//             isScrollable: true,
//             indicatorColor: AppColors.primaryColor,
//             labelColor: AppColors.primaryColor,
//             unselectedLabelColor: Colors.grey.shade700,
//             labelStyle: Themetext.blackBoldText.copyWith(),
//             unselectedLabelStyle: Themetext.blackBoldText.copyWith(),
//             tabs: const [
//               Tab(text: 'Category'),
//               Tab(text: 'Budget'),
//               Tab(text: 'Cities'),
//               Tab(text: 'Brand'),
//               Tab(text: 'Model'),
//             ],
//           ),
//           SizedBox(
//             height: _categoryTabController.index == 0
//                 ? context.mediaQueryHeight / 6
//                 : _categoryTabController.index == 1
//                     ? context.mediaQueryHeight / 7
//                     : _categoryTabController.index == 2
//                         ? context.mediaQueryHeight / 5.5
//                         : _categoryTabController.index == 3
//                             ? context.mediaQueryHeight / 5
//                             : _categoryTabController.index == 4
//                                 ? context.mediaQueryHeight / 5
//                                 : context.mediaQueryHeight / 6,
//             child: TabBarView(
//               controller: _categoryTabController,
//               children: [
//                 buildCategoryTab(
//                   context: context,
//                   height: context.mediaQueryHeight / 5,
//                   width: context.mediaQueryWidth / 3,
//                 ),
//                 buildBudgetList(),
//                 buildCityList(),
//                 buildPaktruckBrandsList(context),
//                 buildModelList()
//               ],
//             ),
//           ),
//           SizedBox(height: context.mediaQueryHeight / 75),
//           buildSectionHeader(
//             context,
//             title: 'Feature Used Truck',
//             onViewAllPressed: () {},
//           ),
//           buildHorizontalList(context, false),
//           SizedBox(height: context.mediaQueryHeight / 75),
//           buildSectionHeader(
//             context,
//             title: 'Manage by PakTruck',
//             onViewAllPressed: () {},
//           ),
//           buildHorizontalList(context, true),
//           SizedBox(height: context.mediaQueryHeight / 75),
//           buildSectionHeader(
//             context,
//             title: 'Used Buses for Sale',
//             onViewAllPressed: () {},
//           ),
//           buildHorizontalList(context, false),
//           SizedBox(height: context.mediaQueryHeight / 75),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TabBar(
//                 dividerColor: Colors.transparent,
//                 tabAlignment: TabAlignment.start,
//                 controller: _autoTabController,
//                 isScrollable: true,
//                 indicatorColor: AppColors.primaryColor,
//                 labelColor: AppColors.primaryColor,
//                 unselectedLabelColor: Colors.grey.shade700,
//                 labelStyle: Themetext.blackBoldText.copyWith(),
//                 unselectedLabelStyle: Themetext.blackBoldText.copyWith(),
//                 tabs: const [
//                   Tab(text: 'Auto store'),
//                   Tab(text: 'Factories'),
//                   Tab(text: 'Showroom'),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 12.0),
//                 child: Text(
//                   'View All',
//                   style: Themetext.blackBoldText
//                       .copyWith(color: AppColors.primaryColor),
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: context.mediaQueryHeight / 1.8,
//             child: TabBarView(
//               controller: _autoTabController,
//               children: [
//                 buildTwoRowHorizontalList(context),
//                 buildTwoRowHorizontalList(context),
//                 buildTwoRowHorizontalList(context),
//               ],
//             ),
//           ),
//           buildSectionHeader(
//             context,
//             title: 'PakTruck Brands',
//             onViewAllPressed: () {},
//           ),
//           buildPaktruckBrandsList(context),
//           SizedBox(height: context.mediaQueryHeight / 75),
//           buildSectionHeader(
//             context,
//             title: 'Truck Machinery Spare parts',
//             onViewAllPressed: () {},
//           ),
//           buildSparePartsList(),
//           SizedBox(height: context.mediaQueryHeight / 75),
//           buildSectionHeader(
//             context,
//             title: 'News',
//             onViewAllPressed: () {},
//           ),
//           TabBar(
//             dividerColor: Colors.transparent,
//             tabAlignment: TabAlignment.start,
//             controller: _thirdTabController,
//             isScrollable: true,
//             indicatorColor: AppColors.primaryColor,
//             labelColor: AppColors.primaryColor,
//             unselectedLabelColor: Colors.grey.shade700,
//             labelStyle: Themetext.blackBoldText.copyWith(),
//             unselectedLabelStyle: Themetext.blackBoldText.copyWith(),
//             tabs: const [
//               Tab(text: 'News'),
//               Tab(text: 'Truck Reviews'),
//               Tab(text: 'Discussion'),
//             ],
//           ),
//           SizedBox(
//             height: context.mediaQueryHeight / 1.8,
//             child: Expanded(
//               child: TabBarView(
//                 controller: _thirdTabController,
//                 children: [
//                   buildVerticalList(context),
//                   buildVerticalList(context),
//                   buildVerticalList(context),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
















// Widget buildSparePartsList() {
//   final spareParts = [
//     'Body Part',
//     'Crush Plant',
//     'Hydraulic Pump',
//     'Cabin',
//     'Hydraulic Jack',
//     'Excavator Boom',
//     'Engine',
//     'Boozer\nCompressor',
//     'Loader Bucket',
//   ];

//   // Group spare parts into rows of three
//   List<List<String>> groupedParts = [];
//   for (int i = 0; i < spareParts.length; i += 3) {
//     groupedParts.add(spareParts.sublist(
//       i,
//       (i + 3) > spareParts.length ? spareParts.length : i + 3,
//     ));
//   }

//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: groupedParts.map((row) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: row.map((part) {
//             return Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Icon(
//                       Icons.circle,
//                       size: 8,
//                       color: Colors.grey,
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       part,
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         );
//       }).toList(),
//     ),
//   );
// }

// Widget buildBudgetList() {
//   final spareParts = [
//     'under 5 lakh',
//     '5 - 1.5 crore',
//     '10 - 20 lakh',
//     '30-40 lakh',
//     '40 - 50 lakh',
//     '50 - 60 crore',
//     '80 lakh-1 crore',
//     '1 - 1.5 crore',
//     '1.5 2 crore',
//   ];

//   // Group spare parts into rows of three
//   List<List<String>> groupedParts = [];
//   for (int i = 0; i < spareParts.length; i += 3) {
//     groupedParts.add(spareParts.sublist(
//       i,
//       (i + 3) > spareParts.length ? spareParts.length : i + 3,
//     ));
//   }

//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: groupedParts.map((row) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: row.map((part) {
//             return Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Icon(
//                       Icons.circle,
//                       size: 8,
//                       color: Colors.grey,
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       part,
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         );
//       }).toList(),
//     ),
//   );
// }

// Widget buildModelList() {
//   final spareParts = [
//     'Corolla',
//     'Civic',
//     'City',
//     'Camry',
//     'Vitz',
//     'Swift',
//     'Sportage',
//     'Fortuner',
//     'Hilux',
//     'Land\nCruiser',
//     'Prado',
//     'Mustang',
//     'Accord',
//     'Altis',
//     'Mehran',
//     'Cultus',
//   ];

//   // Group spare parts into rows of three
//   List<List<String>> groupedParts = [];
//   for (int i = 0; i < spareParts.length; i += 4) {
//     groupedParts.add(spareParts.sublist(
//       i,
//       (i + 4) > spareParts.length ? spareParts.length : i + 4,
//     ));
//   }

//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: groupedParts.map((row) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: row.map((part) {
//             return Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Icon(
//                       Icons.circle,
//                       size: 8,
//                       color: Colors.grey,
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       part,
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         );
//       }).toList(),
//     ),
//   );
// }

// Widget buildCityList() {
//   final spareParts = [
//     'Karachi',
//     'Lahore',
//     'Islamabad',
//     'Rawalpindi',
//     'Peshawar',
//     'Quetta',
//     'Faisalabad',
//     'Multan',
//     'Gujranwala',
//     'Sialkot',
//     'Hyderabad',
//     'Sukkur',
//     'Bahawalpur',
//     'Sargodha',
//     'Abbottabad',
//   ];

//   // Group spare parts into rows of three
//   List<List<String>> groupedParts = [];
//   for (int i = 0; i < spareParts.length; i += 4) {
//     groupedParts.add(spareParts.sublist(
//       i,
//       (i + 4) > spareParts.length ? spareParts.length : i + 4,
//     ));
//   }

//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: groupedParts.map((row) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: row.map((part) {
//             return Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Icon(
//                       Icons.circle,
//                       size: 8,
//                       color: Colors.grey,
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       part,
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         );
//       }).toList(),
//     ),
//   );
// }

// Widget buildPaktruckBrandsList(BuildContext context) {
//   final brands = [
//     {'name': 'Hino', 'icon': 'assets/images/hino.png'},
//     {'name': 'Isuzu', 'icon': 'assets/images/isuzu.png'},
//     {'name': 'Tata', 'icon': 'assets/images/tata.png'},
//     {'name': 'Sinotruk', 'icon': 'assets/images/sinotruk.png'},
//     {'name': 'Kamaz', 'icon': 'assets/images/kamaz.png'},
//     {'name': 'JAC', 'icon': 'assets/images/jac.png'},
//     {'name': 'Scania', 'icon': 'assets/images/scania.png'},
//     {'name': 'Kamaz', 'icon': 'assets/images/kamaz.png'},
//     {'name': 'FAW Pakistan', 'icon': 'assets/images/faw.png'},
//   ];

//   // Group brands into rows of three
//   List<List<Map<String, String>>> groupedBrands = [];
//   for (int i = 0; i < brands.length; i += 3) {
//     groupedBrands.add(brands.sublist(
//       i,
//       (i + 3) > brands.length ? brands.length : i + 3,
//     ));
//   }

//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: groupedBrands.map((row) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: row.map((brand) {
//             return Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       brand['icon']!,
//                       height: 30, // Adjust the size of the icon
//                       width: 30,
//                       fit: BoxFit.contain,
//                     ),
//                     const SizedBox(width: 8),
//                     SizedBox(
//                       width: context.mediaQueryWidth / 6,
//                       child: Text(
//                         brand['name']!,
//                         overflow: TextOverflow.clip,
//                         style: const TextStyle(fontSize: 14),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         );
//       }).toList(),
//     ),
//   );
// }
