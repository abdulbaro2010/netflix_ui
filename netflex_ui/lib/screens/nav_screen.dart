import 'package:flutter/material.dart';
import 'package:netflex_ui/screens/screens.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens =[
    HomeScreen(key: PageStorageKey('homeScreen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String,  IconData> _icons =const{
    'Home': Icons.home,
    'Search' : Icons.search,
    'Coming Soon' : Icons.queue_play_next,
    'More' : Icons.menu,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: _icons
        .map((title, icon) => MapEntry(
          title,
          BottomNavigationBarItem(
            icon: Icon(icon, size: 30.0,),
            // ignore: deprecated_member_use
            title: Text(title),
          )))
          .values
          .toList(),
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          selectedFontSize: 11.0,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 11.0,
          onTap: (index) => setState(() => _currentIndex =index),
      ), 
    );
  }
}