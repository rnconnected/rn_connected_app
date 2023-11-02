import 'package:flutter/material.dart';
import 'package:rn_connected/components/feeds/post_card.dart';
import 'package:rn_connected/components/feeds/post_data.dart';
// Import your post data

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostCard(
            post: post,
          );
        },
      ),
    );
  }
}
