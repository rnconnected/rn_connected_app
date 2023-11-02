import 'package:flutter/material.dart';
import 'package:rn_connected/components/connection/connection_invite.dart';

class NewInvitePage extends StatefulWidget {
  final List<ConnectionInvite> invites; // List of invites

  NewInvitePage({required this.invites});

  @override
  _NewInvitePageState createState() => _NewInvitePageState();
}

class _NewInvitePageState extends State<NewInvitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Invites'),
      ),
      body: ListView.builder(
        itemCount: widget.invites.length,
        itemBuilder: (context, index) {
          final invite = widget.invites[index];
          return ListTile(
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
          );
        },
      ),
    );
  }
}
