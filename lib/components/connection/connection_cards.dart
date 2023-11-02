import 'package:flutter/material.dart';
import 'package:rn_connected/components/connection/connection_invite.dart';
import 'new_invite_page.dart'; // Import the NewInvitePage

Widget viewConnectionsCard(BuildContext context) {
  return InkWell(
    onTap: () {
      // Handle click on "View Connections"
      // You can navigate to the "View Connections" page or perform any action here
    },
    child: Card(
      child: ListTile(
        leading: Icon(Icons.people),
        title: Text('View Connections'),
        trailing: Icon(Icons.arrow_forward),
      ),
    ),
  );
}

Widget newInviteCard(BuildContext context, int inviteCount) {
  return InkWell(
    onTap: () {
      // Use Navigator to push the NewInvitePage
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => NewInvitePage(invites: [
          for (var i = 0; i < inviteCount; i++)
            ConnectionInvite(
              userName: 'User $i',
              userProfileImage: 'assets/images/signup/1.png',
              status: 'Hi, let\'s connect!',
              sentDate: '2 days ago',
              mutualFriends: ["assets/images/signup/1.png", "assets/images/signup/1.png"],
            )
        ],),
      ));
    },
    child: Card(
      child: ListTile(
        leading: Icon(Icons.email),
        title: Text('New Invite ($inviteCount)'),
        trailing: Icon(Icons.arrow_forward),
      ),
    ),
  );
}
