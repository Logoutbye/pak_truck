import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/custom_back_button.dart';
import 'package:testt/src/configs/components/custom_textform_field.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/home/features/vechile_categories/reuseable_tabbar_view.dart/reuseable_tabbar_provider.dart';


// ignore: must_be_immutable
class ReusableTabBarView extends StatelessWidget {
  final List<Tab> tabs;
  final List<Widget> tabViews;
  final String title;
  TextEditingController searchController;
  final Function()? onFilterPressed;
  final Function()? onSortingPressed;

  ReusableTabBarView({
    super.key,
    required this.tabs,
    required this.tabViews,
    required this.title,
    required this.searchController,
    this.onFilterPressed,
    this.onSortingPressed,
  }) : assert(tabs.length == tabViews.length,
            'The number of tabs and tab views must be the same.');

  @override
  Widget build(BuildContext context) {
    return Consumer<ReusableTabBarProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return DefaultTabController(
          initialIndex: provider.selectedTabIndex,
          length: tabs.length,
          child: Scaffold(
            appBar: AppBar(
              leading: CustomBackButton(),
              centerTitle: true,
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(80.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: context.mediaQueryWidth / 1.2,
                          child: CustomTextFormField(
                            borderRadius: 30,
                            leading: Icon(Icons.search),
                            maxLines: 1,
                            minLines: 1,
                            color: AppColors.white,
                            borderColor: AppColors.divider,
                            hintText: 'Search...',
                            controller: searchController,
                            titleText: '',
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: onFilterPressed,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.transparent, width: 2),
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.white,
                            ),
                            child: SvgPicture.asset('assets/svg/filter.svg'),
                          ),
                        ),
                      ],
                    ),
                    TabBar(
                      splashFactory: NoSplash.splashFactory,
                      dividerColor: Colors.transparent,
                      indicatorPadding: EdgeInsets.all(8),
                      tabAlignment: TabAlignment.center,
                      isScrollable: true,
                      indicatorColor: AppColors.primary,
                      indicator: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.checkbox,
                      ),
                      unselectedLabelColor: Colors.grey.shade700,
                      labelStyle:
                          Themetext.blackBoldText.copyWith(color: Colors.white),
                      unselectedLabelStyle: Themetext.blackBoldText.copyWith(),
                      tabs: tabs,
                    ),
                  
                  
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: tabViews,
            ),
          ),
        );
      },
    );
  }
}
