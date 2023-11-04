import 'package:flutter/material.dart';

class LogoutCard extends StatelessWidget {
  final VoidCallback onLogout;

  LogoutCard({required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLogout,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 4,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                Icons.logout,
                size: 32,
                color: Colors.blue,
              ),
              SizedBox(width: 16),
              Text(
                'Logout',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(), // Adds space between text and right arrow
              Icon(
                Icons.arrow_forward,
                size: 32,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
