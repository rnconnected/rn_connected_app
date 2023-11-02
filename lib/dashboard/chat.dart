import 'package:flutter/material.dart';
import 'package:rn_connected/components/chat/chat_interface.dart';
import 'package:rn_connected/components/chat/list_of_users.dart';
class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showChatPopup(context);
          },
          child: Text('Show Post Creation Dialog'),
        ),
      ),
    );
  }
}

void showChatPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: ChatPagePopup(),
        ),
      );
    },
  );
}

class ChatPagePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Page'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            onTap: () {
              // Handle user tap to open chat interface
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatInterface(user: user),
                ),
              );
            },
            leading: CircleAvatar(
              backgroundImage: AssetImage(user.profileImage),
            ),
            title: Text(user.name),
            trailing: user.isOnline
                ? Icon(Icons.online_prediction) // You can use your own online icon
                : SizedBox(), // Hide if user is not online
          );
        },
      ),
    );
  }
}
