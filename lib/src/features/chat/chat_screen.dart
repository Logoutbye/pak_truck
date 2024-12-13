import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testt/src/configs/components/custom_appbar.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/features/my_profile/widget/user_image_avatar_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasDivider: true,
        leading: SizedBox(),
        firstText: 'Pak Truck Chatting',
        secondText: '',
        trailing: Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.notificaiton);
                },
                child: SvgPicture.asset('assets/svg/notification.svg')),
            SizedBox(width: context.mediaQueryWidth / 21)
          ],
        ),
      ),
      body: ListView(
        children: [
          Divider(),
          ListTile(
            contentPadding:
                EdgeInsets.only(top: 0, bottom: 8, right: 0, left: 8),
            leading: UserImageAvatarWidget(imageUrl: ''),
            title: Text(
              'Ibrar',
              style: TextStyle(fontSize: 16),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: context.mediaQueryWidth / 2.4,
                  child: Text(
                    'Toyota Aqua 2020 for sale in Lahore Toyota Aqua 2020 for sale in Lahore',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '22 Nov 2024',
                      style: TextStyle(fontSize: 12),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
