import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String name;
  final String headline;
  final String location;
  final String connections;
  final String image;

  UserProfilePage({
    required this.name,
    required this.headline,
    required this.location,
    required this.connections,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Implement additional options here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(image),
                  ),
                  SizedBox(height: 10),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    headline,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Connections'),
                    subtitle: Text(connections),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Posts'),
                    subtitle: Text('45'), // Replace with actual post count
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement Edit Profile functionality
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UserProfilePage(
      name: 'John Doe',
      headline: 'Flutter Developer',
      location: 'New York, USA',
      connections: '500+',
      image: 'https://example.com/your_profile_image_url.jpg',
    ),
  ));
}
