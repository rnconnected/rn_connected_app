import 'package:flutter/material.dart';
import 'package:rn_connected/components/menu/dark_mode_section.dart';
import 'package:rn_connected/components/menu/divider_widget.dart';
import 'package:rn_connected/components/menu/logout_card.dart';
import 'package:rn_connected/components/menu/menu_container.dart';
import 'package:rn_connected/components/menu/profile_card.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView( // Wrap the body in a SingleChildScrollView
        child: Column(
          children: [
            SizedBox(height: 26),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.black,
                    iconSize: 30,
                    onPressed: () {
                      // Handle settings icon click
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ProfileCard(),
            SizedBox(height: 26),
            DividerWidget(),
            SizedBox(height: 26),
            MenuContainer(),
            SizedBox(height: 26),
            DividerWidget(),
            SizedBox(height: 26),
            DarkModeSection(),
            SizedBox(height: 26),
            DividerWidget(),
            SizedBox(height: 26),
            LogoutCard(onLogout: () { 

             },),
             SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
