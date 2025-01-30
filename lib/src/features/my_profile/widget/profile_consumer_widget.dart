import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/data/response/status.dart';
import 'package:testt/src/features/my_profile/view_model/my_profile_view_model.dart';
import 'package:testt/src/features/my_profile/widget/user_image_avatar_widget.dart';
import 'package:testt/src/model/user/user_model.dart'; // Assuming the user model is here
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';

class ProfileConsumerWidget extends StatelessWidget {
  const ProfileConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (BuildContext context, ProfileViewModel value, Widget? child) {
        if (value.myProfile.status == Status.notStarted) {
          Future.microtask(() => value.fetchMyProfileApi());
        }

        final profileState = value.myProfile;
        final user = profileState.data?.user; // Keep old data if available

        // Show shimmer if no data is available
        if (profileState.status == Status.loading && user == null) {
          return ShimmerLoadingWidget(); // Display shimmer effect
        }

        // Show error message if data is unavailable
        if (profileState.status == Status.error && user == null) {
          return Center(child: Text('Error: ${profileState.message}'));
        }

        // If there's no user data
        if (user == null) {
          return Center(child: Text('User data not available'));
        }

        // If data exists, show the profile
        return UserProfileWidget(user: user);
      },
    );
  }
}

class UserProfileWidget extends StatelessWidget {
  final User user;

  const UserProfileWidget({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserImageAvatarWidget(
        imageUrl: user.profileImage ?? '',
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            user.fullname.isEmpty ? 'Your Name' : user.fullname,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 20),
          SvgPicture.asset(
            'assets/svg/unverified.svg',
            height: context.mediaQueryHeight / 41,
          ),
          SizedBox(width: context.mediaQueryWidth / 70),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/verifyShopScreen');
            },
            child: Text(
              user.isAccountModeVerified ? 'Verified' : 'Unverified',
              style: Themetext.headline.copyWith(
                  color: user.isAccountModeVerified
                      ? Colors.green
                      : AppColors.orange),
            ),
          ),
        ],
      ),
      subtitle: Text(
        'Member Since ${user.createdAt.toFormattedDate()}',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: CircleAvatar(radius: 25),
      ),
      title: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(height: 15, width: 100, color: Colors.white),
      ),
      subtitle: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(height: 12, width: 150, color: Colors.white),
      ),
    );
  }
}
