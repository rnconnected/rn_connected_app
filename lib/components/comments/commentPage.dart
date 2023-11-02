import 'package:flutter/material.dart';
import 'package:rn_connected/components/feeds/post_data.dart';

class CommentPage extends StatefulWidget {
  final Post post;

  CommentPage({required this.post});

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController commentController = TextEditingController();
  List<Comment> comments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display the post
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(widget.post.userAvatar),
                    ),
                    title: Text(widget.post.username),
                    subtitle: Text(widget.post.postText),
                  ),
                  // Check the number of images
                  if (widget.post.postImages.isNotEmpty)
                    if (widget.post.postImages.length == 1)
                      Image.asset(widget.post.postImages[0]) // Display full-size for a single image
                    else
                      // Display images in a grid
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // You can adjust the number of columns as needed
                        ),
                        itemCount: widget.post.postImages.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Image.asset(widget.post.postImages[index]);
                        },
                      ),
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
                          Text('${widget.post.likes} Likes'),
                        ],
                      ),
                      Text('${widget.post.comments} Comments'),
                    ],
                  ),
                  Divider(height: 1),
                ],
              ),
            ),
            // Display user comments
            if (comments.isNotEmpty)
              Column(
                children: comments.map((comment) {
                  return ListTile(
                    leading: CircleAvatar(), // Add user avatar here
                    title: Text(comment.username),
                    subtitle: Text(comment.commentText),
                  );
                }).toList(),
              ),
            Divider(height: 1),
            // Input section for adding comments
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: commentController,
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      addComment();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addComment() {
    String newComment = commentController.text;
    if (newComment.isNotEmpty) {
      Comment comment = Comment(
        username: 'Your Username', // You can replace with user's name
        commentText: newComment,
      );

      setState(() {
        comments.add(comment);
      });

      commentController.clear();
    }
  }

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
}
