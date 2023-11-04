import 'package:flutter/material.dart';
import 'package:rn_connected/components/feeds/feed_page.dart';
import 'package:rn_connected/components/topnav/topnav.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Remove the back arrow
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(30), // Set the preferred height of the app bar
          child:
              TopNavBar(), // Replace YourCustomWidget with your custom content
        ),
      ),
      body: FeedPage(), // Replace the Text widget with FeedPage
    );
  }
}