import 'package:flutter/material.dart';

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

class PostCreationPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage("assets/images/signup/1.png"),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButton<String>(
                          items: <String>['Anyone', 'My Connections']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Handle audience selection
                          },
                          value: 'Anyone', // Default selection
                        ),
                        Text('Anyone', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "What's on your mind?",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle posting the content
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: Text('Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
