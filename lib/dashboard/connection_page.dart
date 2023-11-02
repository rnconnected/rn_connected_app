import 'package:flutter/material.dart';
import 'package:rn_connected/components/connection/connection_cards.dart';
import 'package:rn_connected/components/connection/connection_invite_card.dart';
import 'package:rn_connected/components/connection/connection_invite_list.dart';
import 'package:rn_connected/components/topnav/topnav.dart';

class ConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back arrow
        flexibleSpace: TopNavBar(),
      ),
      body: ListView(
        children: [
          viewConnectionsCard(context), // View Connections Card
          newInviteCard(context, 20), // New Invite (10) Card
          for (var invite in connectionInvites)
            ConnectionInviteCard(invite: invite),
        ],
      ),
    );
  }
}
