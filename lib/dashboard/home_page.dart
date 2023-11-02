import 'package:flutter/material.dart';
import 'package:rn_connected/components/feeds/feed_page.dart';
import 'package:rn_connected/components/topnav/topnav.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back arrow
        flexibleSpace: TopNavBar(),
      ),
      body: FeedPage(), // Replace the Text widget with FeedPage
    );
  }
}
