class Comment {
  final String username;
  final String commentText;

  Comment({required this.username, required this.commentText});
}

class Post {
  final String username;
  final String userAvatar;
  final String postText;
  final List<String> postImages; // List of image URLs
  int likes;
  int comments;
  bool isLiked = false;
  final List<Comment> postComments;

  Post({
    required this.username,
    required this.userAvatar,
    required this.postText,
    required this.postImages,
    this.likes = 0,
    this.comments = 0,
    this.postComments = const [],
  });
}

// Sample post data
final List<Post> posts = [
  Post(
    username: 'John Doe',
    userAvatar: "assets/images/signup/1.png",
    postText: "Caring is a multi-dimensional concept interpreted within one's experiences. Watson (1979) summarized the work of caring as holding humanistic values of trust, developing relationships ...Show more",
    postImages: [
      "assets/images/postImage/1.png",
    ],
    likes: 123,
    comments: 25,
    postComments: [
      Comment(username: 'Alice', commentText: 'Beautiful park!'),
      Comment(username: 'Bob', commentText: 'Nice weather!'),
    ],
  ),
  Post(
    username: 'Jane Smith',
    userAvatar: "assets/images/signup/1.png",
    postText: "Seeing nurses connecting together feels so good. #nurse events2023",
    postImages: [
      "assets/images/postImage/2.png",
      "assets/images/postImage/3.png",
      "assets/images/postImage/4.png",
      "assets/images/postImage/5.png",
      "assets/images/postImage/6.png",
    ],
    likes: 321,
    comments: 53,
    postComments: [
      Comment(username: 'Eve', commentText: 'Amazing journey!'),
    ],
  ),

  Post(
    username: 'John Doe',
    userAvatar: "assets/images/signup/1.png",
    postText: "Seeing nurses connecting together feels so good. #nurse events2023",
    postImages: [
      "assets/images/postImage/7.png",
    ],
    likes: 123,
    comments: 25,
    postComments: [
      Comment(username: 'Alice', commentText: 'Beautiful park!'),
      Comment(username: 'Bob', commentText: 'Nice weather!'),
    ],
  ),

  Post(
    username: 'John Doe',
    userAvatar: "assets/images/signup/1.png",
    postText: "Seeing nurses connecting together feels so good. #nurse events2023",
    postImages: [
      "assets/images/postImage/8.png",
    ],
    likes: 123,
    comments: 25,
    postComments: [
      Comment(username: 'Alice', commentText: 'Beautiful park!'),
      Comment(username: 'Bob', commentText: 'Nice weather!'),
    ],
  ),
  // Add more posts here
];
