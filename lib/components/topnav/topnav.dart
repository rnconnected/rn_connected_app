import 'package:flutter/material.dart';
import 'package:rn_connected/dashboard/chat.dart';
import 'package:rn_connected/dashboard/notification.dart';

class TopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20), // Add margin to increase height
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              // Open the sidebar when the avatar is clicked
            },
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage("assets/images/signup/1.png"),
            ),
          ),
          Container(
            width: 200, // Adjust the width as needed
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.message_outlined, color: Colors.black),
                onPressed: () {
                  showChatPopup(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {
                  // Handle notification icon click
                  showNotificationPopup(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
