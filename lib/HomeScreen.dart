import 'package:flutter/material.dart';
import 'package:flutter_login_screens/HomeContent.dart';
import 'package:flutter_login_screens/SettingsScreen.dart';
import 'package:flutter_login_screens/views/music_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // List of widgets for different tabs
  final List<Widget> _screens = [
    Homecontent(),
    MusicScreen(),
    SettingsScreen(),
  ];

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E), // Dark background
      resizeToAvoidBottomInset: true, // Allow screen resize when keyboard is up
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),
      // BottomNavigationBar with gradient background and elevation
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF16202C), // Dark navy
              Color(0xFF0D1B2A), // Darker navy
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10.0,
              offset: Offset(0, -2), // shadow position
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            selectedItemColor: Color.fromARGB(
                255, 210, 240, 62), // Bright yellow-green for selected item
            unselectedItemColor:
                Colors.white54, // Soft white for unselected items
            backgroundColor: Colors.transparent, // Transparent background
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                _pageController.jumpToPage(index);
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                label: 'Library',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            selectedIconTheme: IconThemeData(size: 30),
            unselectedIconTheme: IconThemeData(size: 24),
          ),
        ),
      ),
    );
  }
}
