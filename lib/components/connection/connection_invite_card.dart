import 'package:flutter/material.dart';
import 'connection_invite.dart';

class ConnectionInviteCard extends StatelessWidget {
  final ConnectionInvite invite;

  ConnectionInviteCard({required this.invite});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(invite.userProfileImage),
          radius: 24.0,
        ),
        title: Text(invite.userName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(invite.status),
            Text('Sent ${invite.sentDate}'),
            SizedBox(height: 8.0),
            Row(
              children: [
                for (var friendImage in invite.mutualFriends)
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(friendImage),
                      radius: 16.0,
                    ),
                  ),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.green,
              ),
              onPressed: () {
                // Handle accept invite
              },
            ),
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.red,
              ),
              onPressed: () {
                // Handle cancel invite
              },
            ),
          ],
        ),
      ),
    );
  }
}
