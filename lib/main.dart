import 'package:flutter/material.dart';

import 'pages/home/home.dart';
import 'pages/connect/connect.dart';
import 'pages/training/training.dart';
import 'pages/explore/events.dart';
import 'pages/explore/explore.dart';
import 'pages/profile/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 3;
  final List<Widget> _pages = [
    Home(),
    Connect(),
    Training(),
    Explore(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VOLT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: SizedBox(
          height: 55,

          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed, // Set type to fixed for no label mode
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                label: '', // Empty label
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.business,
                  color: Colors.red,
                ),
                label: '', // Empty label
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.run_circle,
                  color: Colors.red,
                ),
                label: '', // Empty label
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                  color: Colors.red,
                ),
                label: '', // Empty label
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                label: '', // Empty label
              ),
            ],
          ),
        ),),
    );
  }
}