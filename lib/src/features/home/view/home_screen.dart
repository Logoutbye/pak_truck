import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/custom_text_filed.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/features/home/view/spare_part_details_screen.dart';
import 'package:testt/src/features/my_profile/widget/user_image_avatar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: UserImageAvatarWidget(imageUrl: ''),
        ),
        title: CustomTextFormField(
          maxLines: 1,
          minLines: 1,
          color: AppColors.whiteColor,
            hintText: 'Search used Truck',
            controller: searchTextEditingController),
        actions: [
          InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.dividerColor, width: 2),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.whiteColor),
                  child: SvgPicture.asset('assets/svg/filter.svg'))),
          SizedBox(
            width: context.mediaQueryWidth / 90,
          )
        ],
      ),
    );
  }
}
