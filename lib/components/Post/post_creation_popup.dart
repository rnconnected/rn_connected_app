import 'package:flutter/material.dart';
import 'package:rn_connected/components/Post/PostCreationPopup.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showPostCreationPopup(context);
          },
          child: Text('Show Post Creation Dialog'),
        ),
      ),
    );
  }
}

void showPostCreationPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: PostCreationPopup(),
        ),
      );
    },
  );
}
