import 'package:flutter/material.dart';
import 'notification_item.dart';

class NotificationList extends StatelessWidget {
  final List<NotificationItem> recentNotifications;
  final List<NotificationItem> earlierNotifications;

  NotificationList({
    required this.recentNotifications,
    required this.earlierNotifications,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildSection("Recent Notifications", recentNotifications),
        _buildSection("Earlier Notifications", earlierNotifications),
      ],
    );
  }

  Widget _buildSection(String sectionTitle, List<NotificationItem> notifications) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            sectionTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        for (var notification in notifications)
          NotificationItem(
            title: notification.title,
            description: notification.description,
            time: notification.time,
            isRead: notification.isRead,
            userProfileImage: notification.userProfileImage,
          ),
      ],
    );
  }
}
