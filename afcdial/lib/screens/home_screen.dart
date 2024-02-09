import 'package:flutter/material.dart';
import 'calls_screen.dart';
import 'messages_screen.dart';
import 'contacts_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    CallsScreen(),
    MessagesScreen(),
    ContactsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.call,
                color: _currentIndex == 0 ? Colors.green : Colors.black),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message,
                color: _currentIndex == 1 ? Colors.green : Colors.black),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts,
                color: _currentIndex == 2 ? Colors.green : Colors.black),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,
                color: _currentIndex == 3 ? Colors.green : Colors.black),
            label: 'Settings',
          ),
        ],
        // Customizing label style
        selectedLabelStyle: TextStyle(color: Colors.green),
        unselectedLabelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
