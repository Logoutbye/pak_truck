import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testt/src/configs/color/color.dart';

class NotificationModel {
  final String title;
  final bool isNew;
  final DateTime timestamp;

  NotificationModel({
    required this.title,
    required this.isNew,
    required this.timestamp,
  });
}

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  // Dummy data for notifications
  final List<NotificationModel> notifications = [
    NotificationModel(
      title: "Your ad has been approved",
      isNew: true,
      timestamp: DateTime.now().subtract(Duration(minutes: 10)),
    ),
    NotificationModel(
      title: "Someone liked your post",
      isNew: false,
      timestamp: DateTime.now().subtract(Duration(hours: 3)),
    ),
    NotificationModel(
      title: "New comment on your ad",
      isNew: true,
      timestamp: DateTime.now().subtract(Duration(days: 1)),
    ),
    NotificationModel(
      title: "Your ad is about to expire",
      isNew: false,
      timestamp: DateTime.now().subtract(Duration(days: 1, hours: 2)),
    ),
    NotificationModel(
      title: "Someone messaged you",
      isNew: true,
      timestamp: DateTime.now().subtract(Duration(days: 2)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Group notifications by date
    Map<String, List<NotificationModel>> groupedNotifications = {};
    for (var notification in notifications) {
      String date = DateFormat('yyyy-MM-dd').format(notification.timestamp);
      if (groupedNotifications[date] == null) {
        groupedNotifications[date] = [];
      }
      groupedNotifications[date]!.add(notification);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
      ),
      body: ListView(
        children: groupedNotifications.entries.map((entry) {
          String date = entry.key;
          List<NotificationModel> notificationsForDate = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Header
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  DateFormat('MMMM dd, yyyy').format(DateTime.parse(date)),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
              ),
              // Notifications for this date
              ...notificationsForDate.map((notification) =>
                  NotificationCard(notification: notification))
            ],
          );
        }).toList(),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification.title),
                Text(
                  DateFormat('h:mm a').format(notification.timestamp),
                ),
              ],
            ),
            if (notification.isNew) ...[
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(23)),
                child: Text(
                  ' New ',
                  style: TextStyle(color: AppColors.whiteColor),
                ),
              )
            ]
          ],
        ));
  }
}
