import 'package:flutter/material.dart';

class DarkModeSection extends StatefulWidget {
  @override
  _DarkModeSectionState createState() => _DarkModeSectionState();
}

class _DarkModeSectionState extends State<DarkModeSection> {
  bool isDarkMode = false;

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Add border radius to the card
      ),
      elevation: 4, // Add shadow
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), // Add border radius to the icons
                border: Border.all(
                  color: isDarkMode ? Colors.blue : Colors.yellow, // Border color
                  width: 2, // Border width
                ),
              ),
              child: Icon(
                isDarkMode ? Icons.nightlight_round : Icons.wb_sunny, // Toggle between night and sunny icons
                size: 32,
                color: isDarkMode ? Colors.blue : Colors.yellow, // Toggle icon color
              ),
            ),
            SizedBox(width: 16),
            Text(
              'Switch to Dark Mode',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(), // This widget takes the available space
            Switch(
              value: isDarkMode,
              onChanged: (value) {
                toggleDarkMode();
              },
            ),
          ],
        ),
      ),
    );
  }
}
