import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NumericKeyboard extends StatelessWidget {
  final Function(String) onKeyTapped;

  NumericKeyboard({required this.onKeyTapped});

  List<String> keys = ['1', '2', '3', '4', '5', '6', '7', '8', '9', 'X', '0', 'Enter'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: keys.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  if (keys[index] == 'Enter') {
                    onKeyTapped('enter');
                  } else if (keys[index] == 'X') {
                    onKeyTapped('clear');
                  } else {
                    onKeyTapped(keys[index]);
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 50), backgroundColor: keys[index] == 'X' || keys[index] == 'Enter' ? Colors.blue : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  // Customize colors for "X" and "Enter" buttons
                ),
                child: Text(
                  keys[index],
                  style: TextStyle(
                    fontSize: 23,
                    color: keys[index] == 'X' || keys[index] == 'Enter' ? Color.fromARGB(255, 255, 255, 255) : Color.fromARGB(255, 0, 0, 0),
                    // Customize text color for "X" and "Enter" buttons
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
