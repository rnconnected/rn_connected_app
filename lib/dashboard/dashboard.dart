import 'package:flutter/material.dart';
import 'package:rn_connected/components/Post/post_creation_popup.dart';
import 'package:rn_connected/dashboard/connection_page.dart';
import 'package:rn_connected/dashboard/home_page.dart';
import 'package:rn_connected/dashboard/jobs.dart';
import 'package:rn_connected/dashboard/menu_page.dart';

class DashboardPage extends StatefulWidget {
  final bool showBottomNavBar; // Add a boolean parameter

  DashboardPage({this.showBottomNavBar = true}); // Provide a default value

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: widget.showBottomNavBar // Check the showBottomNavBar property
          ? BottomNavigationBar(
              currentIndex: _currentIndex,
              selectedItemColor: Color(0xFF0073B1),
              unselectedItemColor: Colors.grey[700],
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Connections',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Post',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.work),
                  label: 'Jobs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Menu',
                ),
              ],
              onTap: (index) {
                if (index == 2) {
                  showPostCreationPopup(context);
                } else {
                  switch (index) {
                    case 0:
                      _navigatorKey.currentState!.pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()));
                      break;
                    case 1:
                      _navigatorKey.currentState!.pushReplacement(
                          MaterialPageRoute(builder: (context) => ConnectionPage()));
                      break;
                    case 3:
                      _navigatorKey.currentState!.pushReplacement(
                          MaterialPageRoute(builder: (context) => JobsPage()));
                      break;
                    case 4:
                      _navigatorKey.currentState!.pushReplacement(
                          MaterialPageRoute(builder: (context) => MenuPage()));
                      break;
                  }
                }
                setState(() {
                  _currentIndex = index;
                });
              },
            )
          : null, // Set to null to hide the bottom navigation bar
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (settings) {
          // Default initial route
          return MaterialPageRoute(
            builder: (context) => HomePage(),
          );
        },
      ),
    );
  }
}
