import 'package:flutter/material.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/features/dashborad/widgets/what_do_you_want_to_sell_bottom_sheet.dart';

class PostedSuccessScreen extends StatelessWidget {
  const PostedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.cancel, color: Colors.white),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.dashboard, ((r) => false)),
        ),
        title: const Text(
          'Posted your Add',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: context.mediaQueryHeight / 8),
            // Success Icon
            Image.asset('assets/images/done.png'),
            const SizedBox(height: 20),

            // Success Message
            const Text(
              'Ad Has Been Posted\nSuccessfully!',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Description Text
            const Text(
              'Your Ad Has Been Posted Successfully! Your Ad will\nsoon be reachable to millions of buyers',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoundButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: AppColors.white,
                    ),
                    width: context.mediaQueryWidth / 2.5,
                    title: 'View Your Ad',
                    textStyle: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold),
                    onPress: () {}),
                RoundButton(
                    color: AppColors.orange,
                    width: context.mediaQueryWidth / 2.5,
                    title: 'Post Another Ad',
                    textStyle: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold),
                    icon: Icon(
                      Icons.add_circle,
                      color: AppColors.white,
                    ),
                    onPress: () {
                      whatDoYouWantToSellBottomSheet(context);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
