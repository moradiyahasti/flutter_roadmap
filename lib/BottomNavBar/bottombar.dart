// ignore_for_file: library_private_types_in_public_api

/*
import 'package:flutter/material.dart';
import 'package:network_connectivity/BottomNavBar/screen.dart';

void main() => runApp(BottomNavBar_Screen());

class BottomNavBar_Screen extends StatefulWidget {
  @override
  _BottomNavBar_ScreenState createState() => _BottomNavBar_ScreenState();
}

class _BottomNavBar_ScreenState extends State<BottomNavBar_Screen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bottom Navigation Example'),
        ),
        body: PageView(
          children: _screens,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Screen 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Screen 2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Screen 3',
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:network_connectivity/BottomNavBar/screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen>
    with TickerProviderStateMixin {
  int pageIndex = 0;

  final pages = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Screen 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Screen 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Screen 3',
          ),
        ],
      ),
    );
  }
}
