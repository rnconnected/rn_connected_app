import 'package:flutter/material.dart';
import 'package:rn_connected/components/comments/commentPage.dart';
import 'package:rn_connected/components/feeds/post_data.dart';

class PostCard extends StatefulWidget {
  final Post post;

  PostCard({required this.post});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  void toggleLike() {
    setState(() {
      widget.post.isLiked = !widget.post.isLiked;
      if (widget.post.isLiked) {
        widget.post.likes++;
      } else {
        widget.post.likes--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(7.0),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(widget.post.userAvatar),
            ),
            title: Text(widget.post.username),
          ),
          // Padding removed to eliminate space between the image and text
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 18.0), // Padding on the left and right
            child: Text(widget.post.postText),
          ),

          // Check the number of images
          if (widget.post.postImages.length > 1)
            // Display the first image as a large one and the rest in two rows
            Column(
              children: <Widget>[
                Image.asset(widget.post.postImages[0]), // Display the first image large

                Wrap(
                  spacing: 5.0, // Adjust the spacing between images
                  runSpacing: 5.0, // Adjust the spacing between rows
                  alignment: WrapAlignment.start, // Align items to the start
                  children: widget.post.postImages
                      .sublist(1)
                      .map((image) => Image.asset(image))
                      .toList(),
                ),

                if (widget.post.postImages.length > 3)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'View more (${widget.post.postImages.length - 3} more)',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
              ],
            )
          else
            // Display only the first image if there's only one image
            Image.asset(widget.post.postImages[0]),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: widget.post.isLiked
                        ? Icon(Icons.thumb_up)
                        : Icon(Icons.thumb_up_alt_outlined),
                    color: widget.post.isLiked ? Colors.blue : null,
                    onPressed: toggleLike,
                  ),
                  IconButton(
                    icon: Icon(Icons.comment),
                    onPressed: () {
                      // Navigate to the comment section
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentPage(post: widget.post),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.repeat),
                    onPressed: () {
                      // Repost functionality
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('${widget.post.likes} Likes'),
                  SizedBox(width: 10.0),
                  Text('${widget.post.comments} Comments'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
