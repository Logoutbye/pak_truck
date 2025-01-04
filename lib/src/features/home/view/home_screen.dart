import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/my_profile/widget/user_image_avatar_widget.dart';
import 'package:testt/src/features/sell/widget/sell_textform_field.dart';

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
        title: Column(
          children: [
            SellTextFormField(
              leading: Icon(Icons.search),
              maxLines: 1,
              minLines: 1,
              color: AppColors.whiteColor,
              borderColor: AppColors.dividerColor,
              hintText: 'Search used Truck',
              controller: searchTextEditingController,
              titleText: '',
            ),
          ],
        ),
        actions: [
          InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Utils.dismissKeyboard(context);
              },
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
