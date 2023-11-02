class ConnectionInvite {
  final String userProfileImage;
  final String userName;
  final String status;
  final String sentDate;
  final List<String> mutualFriends;

  ConnectionInvite({
    required this.userProfileImage,
    required this.userName,
    required this.status,
    required this.sentDate,
    required this.mutualFriends,
  });
}
