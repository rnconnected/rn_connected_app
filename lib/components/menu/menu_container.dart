import 'package:flutter/material.dart';
import 'menu_card.dart';

class MenuContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuCard("Share your experience", Icons.people_alt_outlined),
              MenuCard("Room", Icons.people_alt_outlined),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuCard("Nursing humor", Icons.people_alt_outlined),
              MenuCard("Another Menu", Icons.people_alt_outlined),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuCard("Nursing humor", Icons.people_alt_outlined),
              MenuCard("Another Menu", Icons.people_alt_outlined),
            ],
          ),
        ],
      ),
    );
  }
}
