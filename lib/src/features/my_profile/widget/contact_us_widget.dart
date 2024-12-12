import 'package:flutter/material.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/custom_text_filed.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/my_profile/widget/socail_media_row_widget.dart';

class ContactUsWidget extends StatelessWidget {
  ContactUsWidget({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 12),
      children: [
        SizedBox(height: context.mediaQueryHeight / 30),
        Text(
          'Contact Us',
          style: Themetext.headline.copyWith(color: AppColors.primaryColor),
        ),
        SizedBox(height: context.mediaQueryHeight / 30),
        CustomTextFormField(
          hintText: 'Enter your name',
          controller: nameController,
          color: AppColors.greyColor,
          borderColor: Colors.black12,
        ),
        SizedBox(height: context.mediaQueryHeight / 70),
        CustomTextFormField(
          hintText: 'Enter your email address',
          controller: emailController,
          color: AppColors.greyColor,
          borderColor: Colors.black12,
        ),
        SizedBox(height: context.mediaQueryHeight / 70),
        CustomTextFormField(
          hintText: 'Enter your Mobile number',
          controller: mobileNoController,
          color: AppColors.greyColor,
          borderColor: Colors.black12,
        ),
        SizedBox(height: context.mediaQueryHeight / 70),
        CustomTextFormField(
          hintText: 'Manage Subject',
          controller: subjectController,
          color: AppColors.greyColor,
          borderColor: Colors.black12,
        ),
        SizedBox(height: context.mediaQueryHeight / 70),
        CustomTextFormField(
          minLines: 2,
          maxLines: 3,
          hintText: 'Enter your message here',
          controller: messageController,
          color: AppColors.greyColor,
          borderColor: Colors.black12,
        ),
        SizedBox(height: context.mediaQueryHeight / 30),
        RoundButton(title: 'Submit', onPress: () {}),
        ContactDetailsWidget(),
        SizedBox(height: context.mediaQueryHeight / 37),
      ],
    );
  }
}

class ContactDetailsWidget extends StatelessWidget {
  const ContactDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.mediaQueryHeight / 30),
        Text('Address',
            style: TextStyle(
                color: Color(0xFf000000),
                fontSize: 16,
                fontWeight: FontWeight.w500)),
        SizedBox(height: context.mediaQueryHeight / 75),
        Text(
            'Saeed Allam Tower, 37-Commenical zone Liberty Market, Gulberg, Lahore, Pakistan.'),
        SizedBox(height: context.mediaQueryHeight / 20),
        Text('Contact information',
            style: TextStyle(
                color: Color(0xFf000000),
                fontSize: 16,
                fontWeight: FontWeight.w500)),
        SizedBox(height: context.mediaQueryHeight / 75),
        Row(
          children: [
            Text(
              'Phone',
              style: Themetext.blackBoldText.copyWith(color: AppColors.orange),
            ),
            SizedBox(width: context.mediaQueryWidth / 8),
            Text('0315 - (72) (99)-793')
          ],
        ),
        SizedBox(height: context.mediaQueryHeight / 75),
        Row(
          children: [
            Text(
              'WhatsApp',
              style: Themetext.blackBoldText.copyWith(color: AppColors.orange),
            ),
            SizedBox(width: context.mediaQueryWidth / 20),
            Text('0315 - (72) (99)-793')
          ],
        ),
        SizedBox(height: context.mediaQueryHeight / 20),
        Text('Office Timings',
            style: TextStyle(
                color: Color(0xFf000000),
                fontSize: 16,
                fontWeight: FontWeight.w500)),
        SizedBox(height: context.mediaQueryHeight / 75),
        Row(
          children: [
            Text(
              'Monday - Friday:',
              style: Themetext.blackBoldText.copyWith(color: AppColors.orange),
            ),
            SizedBox(width: context.mediaQueryWidth / 11),
            Text('09:00 am - 07:00 pm')
          ],
        ),
        SizedBox(height: context.mediaQueryHeight / 75),
        Row(
          children: [
            Text(
              'Saturday - Sunday:',
              style: Themetext.blackBoldText.copyWith(color: AppColors.orange),
            ),
            SizedBox(width: context.mediaQueryWidth / 20),
            Text('10:00 am - 06:00 pm')
          ],
        ),
        SizedBox(height: context.mediaQueryHeight / 20),
        Text('Links',
            style: TextStyle(
                color: Color(0xFf000000),
                fontSize: 16,
                fontWeight: FontWeight.w500)),
        SizedBox(height: context.mediaQueryHeight / 75),
        SocialMediaRowWidget(
          imagePath: 'assets/images/fb.png',
          title: 'Follow us on Facebook',
          subtitle: 'Click here',
          onTap: () {
            print('Facebook row tapped!');
            // Navigate to another screen or perform an action
          },
        ),
        SocialMediaRowWidget(
          imagePath: 'assets/images/insta.png',
          title: 'Follow us on Instagram',
          subtitle: 'Click here',
          onTap: () {
            print('Instagram row tapped!');
            // Navigate to another screen or perform an action
          },
        ),
        SocialMediaRowWidget(
          imagePath: 'assets/images/tiktok.png',
          title: 'Follow us on TikTok',
          subtitle: 'Click here',
          onTap: () {
            print('tiktok row tapped!');
            // Navigate to another screen or perform an action
          },
        ),
        SocialMediaRowWidget(
          imagePath: 'assets/images/youtube.png',
          title: 'Subscribe us on Youtube',
          subtitle: 'Click here',
          onTap: () {
            print('youtube row tapped!');
            // Navigate to another screen or perform an action
          },
        ),
      ],
    );
  }
}
