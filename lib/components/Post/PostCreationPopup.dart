import 'package:flutter/material.dart';

class PostCreationPopup extends StatefulWidget {
  @override
  _PostCreationPopupState createState() => _PostCreationPopupState();
}

class _PostCreationPopupState extends State<PostCreationPopup> {
  String? selectedValue = 'Everyone';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            title: Text(
              'Create Post',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            actions: [
              ElevatedButton(
                onPressed: () {
                  // Handle posting the content
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Post',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Divider(
              height: 10,
              color: const Color.fromARGB(255, 83, 83, 83),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage("assets/images/signup/1.png"),
                  ),
                  SizedBox(width: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue, // Set background color to blue
                      borderRadius:
                          BorderRadius.circular(12), // Set border radius
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButton<String>(
                      value: selectedValue, // Use the selected value
                      items: <String>['Everyone', 'Connections']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                color: Color.fromARGB(255, 82, 76, 76)), // Set text color to white
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // Handle audience selection
                        setState(() {
                          selectedValue = newValue; // Update the selected value
                        });
                      },
                      style: TextStyle(
                          color: Colors
                              .white), // Set the style of the selected item
                      underline: Container(
                        // Remove the underline
                        height: 0,
                        color: Color.fromARGB(255, 0, 0, 0), // Set the underline color to white
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                maxLines: 27,
                decoration: InputDecoration(
                  hintText: "What's on your mind?",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.image, size: 46),
                Icon(Icons.file_copy, size: 46),
                Icon(Icons.event, size: 46),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
