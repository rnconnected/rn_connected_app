import 'package:flutter/material.dart';

class NotificationData extends NotificationItem {
  NotificationData({
    required String title,
    required String description,
    required String time,
    required String userProfileImage,
    required bool isRead,
  }) : super(
          title: title,
          description: description,
          time: time,
          userProfileImage: userProfileImage,
          isRead: isRead,
        );
}

List<NotificationData> recentNotifications = [
  NotificationData(
    title: 'Aluko Pelumi liked your post',
    description: 'Short description goes here.',
    time: '5 mins ago',
    userProfileImage: "assets/images/signup/1.png",
    isRead: true,
  ),
  NotificationData(
    title: 'John Doe mentioned you',
    description: 'Another short description.',
    time: '15 mins ago',
    userProfileImage: "assets/images/signup/1.png",
    isRead: false,
  ),
  NotificationData(
    title: 'John Doe mentioned you',
    description: 'Another short description.',
    time: '15 mins ago',
    userProfileImage: "assets/images/signup/1.png",
    isRead: false,
  ),
  NotificationData(
    title: 'John Doe mentioned you',
    description: 'Another short description.',
    time: '15 mins ago',
    userProfileImage: "assets/images/signup/1.png",
    isRead: false,
  ),
];

List<NotificationData> earlierNotifications = [
  NotificationData(
    title: 'Alice commented on your post',
    description: 'Comment: Great content!',
    time: '1 hour ago',
    userProfileImage: "assets/images/signup/1.png",
    isRead: true,
  ),
  NotificationData(
    title: 'Bob sent you a message',
    description: 'Message: How are you doing?',
    time: '2 hours ago',
    userProfileImage: "assets/images/signup/1.png",
    isRead: false,
  ),
  NotificationData(
    title: 'Bob sent you a message',
    description: 'Message: How are you doing?',
    time: '2 hours ago',
    userProfileImage: "assets/images/signup/1.png",
    isRead: false,
  ),
  NotificationData(
    title: 'Bob sent you a message',
    description: 'Message: How are you doing?',
    time: '2 hours ago',
    userProfileImage: "assets/images/signup/1.png",
    isRead: false,
  ),
];

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final bool isRead;
  final String userProfileImage;

  NotificationItem({
    required this.title,
    required this.description,
    required this.time,
    required this.isRead,
    required this.userProfileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isRead ? Colors.grey : Colors.blue,
          radius: 20.0,
          backgroundImage: AssetImage(userProfileImage),
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            Text('Received $time'),
          ],
        ),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        children: [
          _buildSection("Recent", recentNotifications),
          _buildSection("Earlier", earlierNotifications),
        ],
      ),
    );
  }

  Widget _buildSection(
      String sectionTitle, List<NotificationData> notifications) {
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
