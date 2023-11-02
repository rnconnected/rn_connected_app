import 'package:flutter/material.dart';
import 'package:rn_connected/components/notification/notification_item.dart';
import 'package:rn_connected/components/notification/notification_list.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showNotificationPopup(context);
          },
          child: Text('Show Post Creation Dialog'),
        ),
      ),
    );
  }
}

void showNotificationPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: NotificationPopup(),
        ),
      );
    },
  );
}

class NotificationPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set the background color to white
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black, // Set the arrow color to black
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Handle the back button press
          },
        ),
        title: Center(
          child: Text(
            'Notifications',
            style: TextStyle(color: Colors.black), // Set text color to black
          ),
        ),
        elevation: 0, // Remove the shadow under the app bar
      ),
      body: Stack(
        children: [
          NotificationList(
            recentNotifications: recentNotifications,
            earlierNotifications: earlierNotifications,
          ),
          Positioned(
            bottom: 0, // Align the widget to the bottom
            left: 0, // Align the widget to the left
            right: 0, // Align the widget to the right
            child: Container(
              height: MediaQuery.of(context)
                  .padding
                  .bottom, // Height of the bottom navigation bar
              color: Colors.white, // Set the color to match the background
            ),
          ),
        ],
      ),
    );
  }
}
